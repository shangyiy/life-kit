---
name: side-quest-recommend
description: >
  Suggests a few optional things to do near you — a tiny at-home start, a local
  outing, or a simple getaway idea — based on real time and place. Everything
  suggested must be real and doable. User picks one option or skips. Use for
  /side-quest-recommend, weekend plans, things to do, what should I do, bored,
  local outing, day trip, getaway ideas, or side quest. Not (yet) multi-day
  travel itineraries or restaurant booking.
---

# Side quest recommend

Help the human choose **one optional thing** that fits *right now* (or the day they named). Dessert, not homework. Skip free.

**How it feels for them:** a short menu of real options → they pick a number (or none). No mode quiz.

## Language (intro / setup)

Resolve `language` in this order (do not invent a family default):

1. Profile / prior turn already set → **reuse**  
2. Else chips if still unknown — user **picks once**:

| Chip | Locale |
|------|--------|
| **繁體中文** | `zh-Hant` |
| **English** | `en` |

3. Change later via settings if the host has one; else accept an explicit user language switch  

**User-facing copy** (menu lead-in, wins, soft lines) follows that pick.  
**Place names** may stay in the venue’s local language.  
**Web search** uses the **place’s** language (see [references/web-search.md](references/web-search.md)) — not only UI language.

## #1 rule — grounded by data

**Everything must be real and doable.** No vibes-only inventing.

| Must be grounded | How |
|------------------|-----|
| **Time** | Real clock or user-stated datetime → weekday + free window (not a guessed “sometime”) |
| **Location** | User-stated place, else **network/IP geolocation** — not a made-up city |
| **Each outing/getaway** | Real place/event · open (or checkable) for that time · within travel budget · win is binary and actually completable |
| **Each home starter** | Doable at home in minutes with no fake props or invented “local” claim |

If any of those fail → **SKIP that option** (or thinner menu). Never invent open hours, seasons, closures, venues, or “rooms available tonight.” Prefer a short honest menu over a pretty false one.

## 1. Context (main agent only)

Resolve a **context packet** before spawning. Prefer tools over questions.

| Field | Rule |
|--------|------|
| `language` | From intro/setup pick: `zh-Hant` · `en`. **Ask with chips if missing.** |
| `datetime` | ISO local + **weekday** (user-stated, else system clock; if unknown, ask once) |
| `location` | User-stated if any; else **network / IP geolocation** (city/metro OK). **Do not ask** if network works. Optional soft note in their language. Ask **only** if lookup fails or is useless. User correction always wins. |
| `free_window` | One of: `short` · `half-day` · `overnight` · `full-weekend` · `unknown` (infer from datetime + message — see table below) |
| `transport` | Default walk + drive OK |
| `max_one_way_local` | **60 min** (half-day may stretch ≤75 if clearly worth it) |
| `max_one_way_getaway` | **2.5 h** unless they said farther |

**Infer `free_window` (aliases → enum):**

| User / clock signal | Set `free_window` |
|---------------------|-------------------|
| Soft morning, free evening, “a bit of time”, ≤~1–2h free | `short` |
| Free afternoon, “half day”, free day, “this morning then free” with ≥ half-day left | `half-day` |
| Overnight, getaway, “out of town tonight/this weekend” | `overnight` |
| Whole Sat–Sun free / full weekend | `full-weekend` |
| Unclear | `unknown` |

Pass this packet **unchanged** into every mode subagent. Options must **fit this packet** (wrong day, wrong city, or not doable now → invalid).

## 2. Per mode: launch A/B subagents (parallel)

For **each launched** mode below, spawn **two independent** subagents (**A** and **B**) with the **same** context packet and mode files. Do **not** write mode options yourself. Do **not** share A’s answer with B (independent runs).

| Mode | File | Tools | Job |
|------|------|--------|-----|
| **starter** | [modes/starter.md](modes/starter.md) | No web | Tiny at-home option, doable at packet time |
| **half-day** | [modes/half-day.md](modes/half-day.md) + [references/web-search.md](references/web-search.md) | **Must** search + fetch | Same-day outing, real + open that day |
| **weekend** | [modes/weekend.md](modes/weekend.md) + [references/web-search.md](references/web-search.md) | **Must** search + fetch | Doable getaway sketch, or SKIP |

### Which modes to launch (gate on `free_window`)

| `free_window` | Launch A/B for |
|---------------|----------------|
| `short` | **starter**; add **half-day** only if **usable outdoor window** (below) |
| `half-day` | **starter** + **half-day** |
| `overnight` | **starter** + **half-day** + **weekend** |
| `full-weekend` | **starter** + **half-day** + **weekend** |
| `unknown` | full set: starter + half-day + weekend |
| user explicitly asked getaway / overnight | force **weekend** A/B on (in addition to gate) |

**Usable outdoor window (for `short` → half-day):** launch half-day only if remaining time to **18:00 local** (or user-stated end) is **≥ ~2 hours**. If sunset/tools unknown: launch half-day only when local hour **≤ 15**. Else starter only — prefer SKIP half-day over a rushed dark outing.

For each launched mode, spawn **two independent** subagents (**A** and **B**). Paths: absolute if available, else skill-root-relative.

**A/B exploration seeds** (same packet; different bias so A/B is not a duplicate race):

| Label | Bias |
|-------|------|
| **A** | Query-set order as in web-search.md; prefer rank **1→2** when verified. Starter: prefer coffee/tea or meal families. |
| **B** | Shift query order (markets / 直売 earlier; events later); prefer a **different venue class or nearby ward/town** when honest. Starter: prefer air / tidy / water (not brew). |

**Each A/B subagent prompt:**

```
You are proposing ONE side-quest option for mode: <mode>. Run label: <A|B> (independent — do not assume another run’s answer).
Exploration seed: <paste A or B bias from SKILL table>
#1 rule: grounded by data — time, location, and the quest must be REAL and DOABLE for the context packet. If not, STATUS: SKIP.
Context packet: <paste full packet including language>
Write win/why in packet.language. Search queries in the place’s language (see web-search.md).
Follow the mode file: <path>
If half-day or weekend: ALSO follow web-search: <path to references/web-search.md>
  — query set for this mode; after verify use “Among verified candidates” rank when you have multiple ideas — emit only ONE best OPTION (or SKIP).
Tools: <starter: no web | half-day/weekend: MUST web_search + open/fetch pages before OPTION>
OPTION must cite a real source URL when claiming a place/hours.
Return STATUS: OPTION | SKIP using the Output section of the mode file only.
Do not invent venues/hours. Not confident after lookup → SKIP or check-before-go with URL — never fabricate.
```

Wait for all A/B pairs of **launched** modes.

If **no** subagent tool: for each launched mode, run the mode file **twice yourself** as A/B with the same exploration seeds; still use web-search for half-day/weekend.

### Date range (vacation day-slice)

If the user gives a **range of days**: for each day (cap: **≤3 days** default, or ask which days if range is longer), run half-day **A/B** (starter A/B once for the trip is enough; weekend only if overnight fits that day). Still **not** a multi-city itinerary. Apply web-search **no-repeat** across days when another grounded rank ≥2 option exists.

## 3. Judge A/B → one winner per mode (main agent)

For each mode, take the A and B results and **pick one winner** (or none).

### Drop (never show)

Either A or B if it fails grounding:

1. Named place/hours without a source URL (outing/getaway) or clear home-only doability (starter)  
2. Wrong **weekday/date** for market/event/hours  
3. Not doable in the free window (e.g. leave-tonight overnight, no booked stay)  
4. Travel clearly over packet max one-way  

If both fail → that mode contributes **nothing** (silent SKIP).

### Choose winner when both are OPTION

Use [references/web-search.md](references/web-search.md) **Among verified candidates**:

1. Higher rank wins: **dated event → weekday market → 直売 → park/landmark**  
2. Same rank: shorter one-way → clearer binary win → better official URL  
3. If A and B are **the same place** (or near-duplicate): keep the stronger hours/URL write-up (single candidate)  
4. Prefer dessert energy (easy win) over logistics-heavy when ranks equal  

Main agent **judges**; do not invent a third option. Do not average two places into a mashup.

### Menu

From the mode winners, build a **short friend-text menu**. Do not auto-pick for the human.

**Example compression:**

half-day OPTION →  
→ en: `1. Sunday San Carlos market — grab one fruit (~15 min) · 9–1 · https://…`  
→ zh-Hant: `1. 週日聖卡洛斯市集 — 買一顆水果回家（約15分）· 9–1 · https://…`

weekend OPTION →  
→ en: `2. Coast overnight — leave Sat, one sleep, back Sun (~2h) · check stay · https://…`  
→ zh-Hant: `2. 海岸過夜 — 週六出門、住一晚、週日回（約2小時）· 住宿請自查 · https://…`

- Human labels only — **not** STARTER / HALF-DAY / WEEKEND chrome, **not** “A/B” labels  
- Omit modes with no winner  
- Soft lead-in in `packet.language`; “pick one or none”  
- If user **asked getaway/overnight** and weekend has no winner → one soft honest line (in `packet.language`) that overnight isn’t honest for this window / needs a booked stay or freer Fri–Sat — then still show remaining winners

```
# en
hey — pick one or none:
1. …
2. … (hours · short travel · link if useful)

# zh-Hant
嗨 — 選一個或不選：
1. …
2. …（時間 · 車程 · 連結）
```

If **zero** winners → one honest starter yourself from `modes/starter.md` if grounded, or say you couldn’t verify an outing. **Do not invent fillers.**

**Stop and wait** for a number (or skip).

**After pick:** at most **+3 bullets** (how to start, one check-before-go, one backup). No multi-stop itinerary, no booking.

## Shared honesty

- **#1 rule wins** over filling the menu.  
- Fragile hours/places → **`check-before-go`** + URL.  
- Prefer free/cheap; mention drive cost when far.  
- Binary win only — something they can actually finish.  
- Thinner menu > false dessert.

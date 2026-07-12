# life-kit

Portable [Agent Skills](https://agentskills.io) pack.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-resume`](./skills/review-resume/SKILL.md) | `/review-resume` | Honest resume ↔ JD fit review (hiring-manager lens) |
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | Subagent audits a skill against a best-practices URL |
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | A few optional things to do near you — pick one or skip |

## Install

```bash
./install.sh grok
# or
grok plugin install /path/to/life-kit --trust
# or (GitHub)
grok plugin install shangyiy/life-kit --trust
```

## review-resume

Self-service hiring coach for strong candidates. Paste a JD and resume:

```text
/review-resume
[paste JD]
[paste resume]
```

Honest fit calls (Strong / Stretch / Weak / Not the right fit). No ATS hacks, no invented experience.

Formerly the standalone **hire-signal** pack; now lives here under `skills/review-resume`.

## side-quest-recommend

```text
/side-quest-recommend
```

1. Resolve datetime + location  
2. Run **starter / half-day / weekend** as **subagents**  
3. Show overall **numbered options** — user picks  

No mode quiz. Skip free. Never invent hours/venues.

## License

MIT

# life-kit

Portable [Agent Skills](https://agentskills.io) pack for personal life tooling (weekend boards, local recommend loops, etc.).

Umbrella name on purpose — reorganize or split skills later without renaming every consumer on day one.

`plugin.json` is Grok-installer metadata. Skills themselves work in any harness that loads `skills/<name>/SKILL.md`.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | Build a 1–3 card Side Quest board (Easy day-start + local/seasonal outing) with real web sources, honest hours, soft exits |

## Install

**Any harness** (from a clone):

```bash
./install.sh grok      # ~/.grok/skills/<skill>
./install.sh cursor
./install.sh claude
./install.sh agents
./install.sh codex
./install.sh all       # user-level for the above
./install.sh project   # .agents/skills + .cursor/skills in cwd
```

**Grok plugin:**

```bash
grok plugin install shangyiy/life-kit --trust
grok plugin enable life-kit
```

## Side Quest recommend (quick)

```text
/side-quest-recommend
# or: weekend board / things to do tomorrow (Mission home, drive ≤60m, …)
```

Outputs up to three cards: Easy home · Easy near · Stretch. Pick 0–2. Skip free. Never invent open hours. Guide-agnostic (no required bot persona).

## Layout

```text
life-kit/
  plugin.json
  install.sh
  README.md
  skills/
    side-quest-recommend/
      SKILL.md
```

## License

MIT (skills may note otherwise in frontmatter).

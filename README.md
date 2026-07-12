# life-kit

Portable [Agent Skills](https://agentskills.io) pack for personal life tooling (starters, half-day and weekend side quests, etc.).

Umbrella name on purpose — reorganize or split skills later without renaming every consumer on day one.

`plugin.json` is Grok-installer metadata. Skills themselves work in any harness that loads `skills/<name>/SKILL.md`.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | Three modes: **starter** (at-home ritual), **half-day** (local outing), **weekend** (overnight sketch). Web + honest hours on trip modes; subagent hard-filter audit |

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

## side-quest-recommend (quick)

Standalone — no app setup, no bot persona required.

```text
/side-quest-recommend starter
/side-quest-recommend half-day
/side-quest-recommend weekend
# or natural language: "brew tea starter", "half-day near Mission", "weekend getaway under 2.5h"
```

| Mode | Output |
|------|--------|
| **starter** | 1 tiny home card (e.g. brew + sit 5 min) |
| **half-day** | Up to 2 local outing cards; subagent audit |
| **weekend** | Overnight trip sketch (anchor + day + optional stay type); subagent audit |

Never invent open hours. Trip modes require a separate auditor subagent for hard filters.

Evals (manual rubric): [`skills/side-quest-recommend/evals/`](./skills/side-quest-recommend/evals/).

## Layout

```text
life-kit/
  plugin.json
  install.sh
  README.md
  skills/
    side-quest-recommend/
      SKILL.md
      modes/
        starter.md
        half-day.md
        weekend.md
      evals/
        cases.json
        README.md
```

## License

MIT (skills may note otherwise in frontmatter).

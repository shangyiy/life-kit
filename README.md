# life-kit

Portable [Agent Skills](https://agentskills.io) pack. Umbrella name on purpose.

`plugin.json` is Grok-installer metadata. Skills load from `skills/<name>/SKILL.md`.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | Subagent audits a skill against a best-practices URL |
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | One side quest that fits **datetime + location** |

## Install

```bash
./install.sh grok
# or
grok plugin install shangyiy/life-kit --trust
```

## side-quest-recommend

```text
/side-quest-recommend
# or: things to do this Saturday near Mission
```

Resolves when + where, picks **one** honest option. No mode quiz. No multi-card board unless asked.

## License

MIT

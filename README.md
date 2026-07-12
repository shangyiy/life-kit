# life-kit

Portable [Agent Skills](https://agentskills.io) pack.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | Subagent audits a skill against a best-practices URL |
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | A few optional things to do near you — pick one or skip |

## Install

```bash
./install.sh grok
# or
grok plugin install /path/to/life-kit --trust
```

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

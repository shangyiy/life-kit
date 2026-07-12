# life-kit

Portable [Agent Skills](https://agentskills.io) pack. Umbrella name on purpose — reorganize or split skills later without renaming every consumer on day one.

`plugin.json` is Grok-installer metadata. Skills themselves work in any harness that loads `skills/<name>/SKILL.md`.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | One subagent audits a skill against a best-practices URL (default: [Anthropic Agent Skills best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)) |
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | Default: home starter + local outs from curated slate. Or name starter / half-day / weekend. No mode quiz on bare slash. |

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

## review-skill (quick)

```text
/review-skill path/to/skills/my-skill
/review-skill path/to/skills/my-skill <rubric-url>
```

Spawn a subagent; it audits against the link. You don’t self-audit.

## side-quest-recommend (quick)

```text
/side-quest-recommend              # default product board (starter + half-day outs)
/side-quest-recommend starter      # home only
/side-quest-recommend half-day
/side-quest-recommend weekend      # getaway sketch — not the Sat product board
```

Bare slash does **not** ask which mode. Never invent open hours. Outs from curated slate; audit pass on KEEP/DROP.

## Layout

```text
life-kit/
  plugin.json
  install.sh
  README.md
  skills/
    review-skill/
      SKILL.md
    side-quest-recommend/
      SKILL.md
      modes/
```

## License

MIT (skills may note otherwise in frontmatter).

# life-kit

Portable [Agent Skills](https://agentskills.io) pack. Umbrella name on purpose — reorganize or split skills later without renaming every consumer on day one.

`plugin.json` is Grok-installer metadata. Skills themselves work in any harness that loads `skills/<name>/SKILL.md`.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | One subagent audits a skill against a best-practices URL (default: [Anthropic Agent Skills best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)) |
| [`side-quest-recommend`](./skills/side-quest-recommend/SKILL.md) | `/side-quest-recommend` | Three modes: **starter**, **half-day**, **weekend**. Web + honest hours on trip modes |

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
/side-quest-recommend starter
/side-quest-recommend half-day
/side-quest-recommend weekend
```

Standalone — no app setup, no bot persona. Never invent open hours. Trip modes use a separate hard-filter audit pass (subagent preferred).

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
      evals/
```

## License

MIT (skills may note otherwise in frontmatter).

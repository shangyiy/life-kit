# life-kit

Portable [Agent Skills](https://agentskills.io) pack. Umbrella name on purpose — reorganize or split skills later without renaming every consumer on day one.

`plugin.json` is Grok-installer metadata. Skills themselves work in any harness that loads `skills/<name>/SKILL.md`.

## Skills

| Skill | Slash | What it does |
|-------|--------|----------------|
| [`review-skill`](./skills/review-skill/SKILL.md) | `/review-skill` | Spawn subagent critics against a best-practices URL (default: [Anthropic Agent Skills best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)) |

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
/review-skill path/to/skills/my-skill https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices
/review-skill --pr 1 critics=3
```

Orchestrator fetches the rubric link, spawns parallel read-only critic subagents (discovery / structure / concision by default), synthesizes verdict. Does not auto-edit the target unless you ask.

## Layout

```text
life-kit/
  plugin.json
  install.sh
  README.md
  skills/
    review-skill/
      SKILL.md
```

## License

MIT (skills may note otherwise in frontmatter).

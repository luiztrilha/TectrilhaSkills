# Installing Skills

Install only skills that you understand and trust. A skill can change how an
agent reasons, what files it reads, and what commands it prefers.

## Safe Install Flow

1. Read `SKILL.md`.
2. Inspect scripts and linked assets.
3. Search for secrets, private paths, network calls, and destructive commands.
4. Install into a local skill folder.
5. Restart the agent runtime if the runtime loads skills at startup.
6. Run a small test prompt.

## Common Locations

Use your runtime documentation as the source of truth. Typical local layouts are:

```text
~/.codex/skills/
~/.agents/skills/
~/.codex/superpowers/
```

## Upgrade Flow

1. Compare the old and new versions.
2. Read new scripts before running them.
3. Keep local customizations separate from upstream skill files.
4. Test on a non-critical task first.

# Installing Skills

Install only skills that you understand and trust. A skill can change how an
agent reasons, what files it reads, what commands it prefers, and when it asks
for network or filesystem access.

## Before You Install

- Vet any third-party or unknown skill first.
- Prefer the narrowest skill that matches the task.
- Treat public catalogs as guidance, not proof that a skill is safe for your
  runtime.
- Do not reinstall preloaded system skills unless you intentionally want to
  replace them.

## Safe Install Flow

1. Read `SKILL.md` fully.
2. Inspect scripts, linked assets, helper references, and manifests.
3. Search for secrets, private paths, network calls, credential access, and
   destructive commands.
4. Classify the permission scope: what it reads, what it writes, what commands
   it runs, and whether it needs network access.
5. Install into a local skill folder using the runtime's normal install path or
   helper scripts.
6. Restart the agent runtime if the runtime loads skills at startup.
7. Run a small test prompt.

## Typical Source Channels

- Curated upstream skill lists
- Experimental upstream skill lists
- A GitHub repository path
- A full GitHub tree URL

If a skill comes from a repo or marketplace you have not reviewed before, do a
security-first vetting pass before installation.

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

## Runtime Notes

- Installing from remote repositories usually requires network access.
- In sandboxed environments, ask for escalation instead of silently failing
  over to unsafe workarounds.
- Some runtimes ship preinstalled system skills separately from user-installed
  skills; document that distinction before telling someone to reinstall.
- After installation, tell the user to restart the runtime so the new skill can
  be discovered.

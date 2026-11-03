# Claude Code project profiles

Optional starting points for a project's `.claude/settings.json` and `CLAUDE.md`, taken from the shotpilot project with its project-specific entries removed. They are not applied automatically. This directory is ignored by chezmoi and is not deployed to the home directory.

`base` keeps context cost low and guards the repository:

- Auto memory is off. Decisions go in committed files under `.claude/rules/` instead.
- Bash output is capped at 12,000 characters, claude.ai connectors and the agent view are off, the built-in Explore/Plan agents are disabled, and subagents use Sonnet.
- Read-only git commands are allowed, `git push` always asks, and edits to `.git/` and reads of `.env` files are denied.
- `CLAUDE.md` imports `AGENTS.md` as the single source of project rules and adds compact instructions.

Add project-specific permissions (build and test commands, generated output directories) in the project itself.

To use it, first check whether the target project already has these files. If it does, review and merge manually rather than overwriting. For a new project, from this dotfiles checkout:

```sh
project=/absolute/path/to/project
mkdir -p "$project/.claude"
cp -n claude-profiles/base/.claude/settings.json "$project/.claude/settings.json"
cp -n claude-profiles/base/CLAUDE.md "$project/CLAUDE.md"
```

`CLAUDE.md` expects an `AGENTS.md` next to it. Keep machine-local permissions in `.claude/settings.local.json`, which should not be committed.

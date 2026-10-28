# dotfiles

Machine configuration managed with [chezmoi](https://www.chezmoi.io/), based on the MIT-licensed [chezmoi dotfiles template](https://github.com/chezmoi/dotfiles). Start with TAKT runtime settings; add other configuration deliberately.

## TAKT configuration

`dot_takt/runtime.yaml` is the chezmoi source for `~/.takt/runtime.yaml`. It selects Codex GPT-6.1 Terra medium by default, Pi Claude CLI Opus for the assistant, and an optional `luna-review` assignment using Pi GPT-6 Luna max for review-tagged steps.

Install TAKT, Codex, Claude Code, and Pi separately. To install the Pi extensions individually (including computer-use, browser-use, and OpenDesign), review and run the opt-in script:

```sh
sh scripts/install-pi-packages.sh
```

The script installs standalone packages, not an agent bundle. Browser-use was previously configured per project on this machine; the script installs it globally on the destination. Platform permissions and provider-specific prerequisites must be configured separately.

Authenticate on each machine separately (`codex login`, `claude auth login`, and Pi `/login` for OpenAI Codex). Do not copy credentials into this repository. Review extension trust and version compatibility before installing; `pi-claude-tool-schema` requires Pi 1.4 or later.

## Preview and apply

`./install.sh` follows the official template: it installs chezmoi if needed and immediately runs `chezmoi init --apply` against this checkout. **It can overwrite existing managed files.** Back up existing settings and preview the diff before running it; inspect the script and downloaded installer first.

For a safer preview, install chezmoi using its official instructions. To try this local checkout as a source without modifying existing settings first:

```sh
chezmoi --source "$HOME/Projects/dotfiles" diff
chezmoi --source "$HOME/Projects/dotfiles" apply --dry-run --verbose
```

Only after reviewing the diff and backing up any existing target files:

```sh
chezmoi --source "$HOME/Projects/dotfiles" apply
```

Adapt the source path on other machines. Installation and apply have not yet been tested on Windows. Pi resources and credentials may differ across environments.

## Safety

Do not commit tokens, API keys, OAuth credentials, session logs, caches, or private keys. Check `git diff --cached` and run a secret scanner before publishing, even to a private repository.

## Known limitations

- Terra's Codex provider has passed a minimal live response test. Pi's managed SDK did not recognize Terra.
- Luna through Pi can respond, but web search and shell tools with the Codex adapter did not work in earlier smoke tests. Recheck after changes.
- `claude-cli` and `pi-web-access` were verified with a minimal search after Claude CLI login. Full workflow and all tool permissions are not yet verified.
- No bootstrap scripts are run automatically. Package sources are not version-pinned yet; review updates before use.

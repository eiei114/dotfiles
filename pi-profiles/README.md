# Pi project profiles

Optional starting points for per-project `.pi/settings.json`. The `ios`, `game`, and `oss` profiles currently contain no project-specific packages. Add reviewed packages when there is a concrete need; these profiles do not automatically detect project types or install anything.

To use one, first check whether the target project already has `.pi/settings.json`. If it does, review and merge manually rather than overwriting it. For a new file, from this dotfiles checkout:

```sh
project=/absolute/path/to/project
mkdir -p "$project/.pi"
# Only use this command when "$project/.pi/settings.json" does not already exist.
cp -n pi-profiles/ios/settings.json "$project/.pi/settings.json"
```

Choose `game` or `oss` in place of `ios` as needed. Pi loads project settings only after project trust is granted. Review package code and permissions before adding extensions. This directory is ignored by chezmoi and is not deployed to the home directory.

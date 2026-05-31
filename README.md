# mentaldesk/homebrew-tap

Homebrew tap for [mentaldesk](https://github.com/mentaldesk) tools.

## Install

```bash
brew install mentaldesk/tap/tuicode
```

Or tap first, then install by short name:

```bash
brew tap mentaldesk/tap
brew install tuicode
```

## Formulae

| Formula | Upstream | Description |
|---|---|---|
| [`tuicode`](Formula/tuicode.rb) | [mentaldesk/TuiCode](https://github.com/mentaldesk/TuiCode) | Minimalist terminal code editor for working over SSH. On macOS the formula also drops an iTerm2 [Dynamic Profile](https://iterm2.com/documentation-dynamic-profiles.html) so native shortcuts (Cmd+C/V/X/Z/A, Cmd+arrows, etc.) reach the editor. |

## Releases

Formula bumps are opened automatically by the upstream repo's release workflow when a new `v*` tag ships. PRs against this repo run `brew audit --strict` before merge.

## Reporting issues

For bugs or feature requests in the underlying tool (e.g. TuiCode), file against the upstream repo. For formula bugs (install fails, post_install misbehaves, audit warnings), file against this repo.

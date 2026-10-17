class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.83/a-team-0.1.83-osx-arm64.tar.gz"
      sha256 "f12be9095a990afbd052cddcba5ed6343042298eb82a9841cc8676b8ce8ada2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.83/a-team-0.1.83-linux-x64.tar.gz"
      sha256 "3cf49da772d16343b1c15e74dbc73fae810c0d882f0d8905411718da2f8e7fb9"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.83/a-team-0.1.83-linux-arm64.tar.gz"
      sha256 "0e54d3c080c2a0ad92cc3e88057fa03ef9e4480153faa54f8271ef946c4a8277"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/a-team"
  end

  def caveats
    <<~EOS
      The agents run in Claude Code, which needs to be installed and logged in:
        https://docs.anthropic.com/en/docs/claude-code

      Add a team by copying the example into your config folder:
        mkdir -p ~/.config/a-team/teams
        cp #{opt_libexec}/examples/team.json ~/.config/a-team/teams/<name>.json
      then run `a-team install` to start the dispatcher.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/a-team version")
  end
end

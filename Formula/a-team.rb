class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.14/a-team-0.3.14-osx-arm64.tar.gz"
      sha256 "56c6f735171cebee6ecb0ad1a2db785dc0ef0e4ab2ce187bbdf85b22f96e2855"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.14/a-team-0.3.14-linux-x64.tar.gz"
      sha256 "b0e07b5df0450d99845390cf5adb7263d2a20006f8f323706ad556239a373673"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.14/a-team-0.3.14-linux-arm64.tar.gz"
      sha256 "c28088283e2da07167da4352e2d364cb215151dafff59c9cc267bc479f337fbe"
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

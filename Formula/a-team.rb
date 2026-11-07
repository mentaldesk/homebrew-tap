class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.45/a-team-0.2.45-osx-arm64.tar.gz"
      sha256 "dcd31090f01dba6e8d8757eff095ed464596a5b1475e70d3b714fb663f30e9b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.45/a-team-0.2.45-linux-x64.tar.gz"
      sha256 "747aaee999a3494ee3c0dffbefb35024d99dff8f6b0fd8781e987032efdc8fee"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.45/a-team-0.2.45-linux-arm64.tar.gz"
      sha256 "5e7df9e882173c969c6db4d7d40af46249e779981c87a625cb4ebdc5a12430fd"
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

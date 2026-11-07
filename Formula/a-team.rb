class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.50/a-team-0.2.50-osx-arm64.tar.gz"
      sha256 "564a4648b56a1d4ae9df0121c14595d10e6b310820cec8b8836c5618369787f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.50/a-team-0.2.50-linux-x64.tar.gz"
      sha256 "ceef719aa96ed5e57603cc94677b95b86af2f572bec740a68034dc4602f8c07d"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.50/a-team-0.2.50-linux-arm64.tar.gz"
      sha256 "e723a964b56adcd72fe2a0093bf0e101fb893904288195a41fec6a844cabd008"
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

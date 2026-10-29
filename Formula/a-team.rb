class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.6/a-team-0.2.6-osx-arm64.tar.gz"
      sha256 "ea7187062d208fb98d97c7ff27f99babf3a50ebf3531c5a6e7963b203fe39935"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.6/a-team-0.2.6-linux-x64.tar.gz"
      sha256 "f3ddc8b76acbc8767ed5f4df7551582af6a01b875d9fee1b95a376fad9089750"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.6/a-team-0.2.6-linux-arm64.tar.gz"
      sha256 "32b118189a280ba3d59a9a52554404556951d81b854736224396e8a0de679489"
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

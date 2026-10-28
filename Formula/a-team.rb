class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.1/a-team-0.2.1-osx-arm64.tar.gz"
      sha256 "fe606837d74bafeebf1ab94545ce3647401bb8c45cc27b7429224af1180a8622"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.1/a-team-0.2.1-linux-x64.tar.gz"
      sha256 "2c72b9f391d2113a6f8bd378f388766f2571352bd20873e3d97fcf2fbdb7ba0e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.1/a-team-0.2.1-linux-arm64.tar.gz"
      sha256 "7c6d8c1da388e7fb0124ee0ba5301e4dd7887d70cefe27918e9710148415ca59"
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

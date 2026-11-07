class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.53/a-team-0.2.53-osx-arm64.tar.gz"
      sha256 "e3081971e1aedeac52befd5cfdcf7ba184a1323929a325522c14a505bca4e3b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.53/a-team-0.2.53-linux-x64.tar.gz"
      sha256 "be63eae2bbac2ccb9a0b923d3d37a493aad65dc31f81194f8aa729ff445c2035"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.53/a-team-0.2.53-linux-arm64.tar.gz"
      sha256 "25938720a213aad6441954a1c0ade2c30b8cf49c82bed44d667cccb36e3ae3b8"
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

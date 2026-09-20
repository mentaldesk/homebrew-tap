class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.5/a-team-0.0.5-osx-arm64.tar.gz"
      sha256 "649fcc5d0a1bd942b138239f4e0e34e27ccb4996ce8adca9970ab4e5ada9973d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.5/a-team-0.0.5-linux-x64.tar.gz"
      sha256 "0f18321c810dbd1777310f98ba24050925a54317318c7b4ad88ede8820921186"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.5/a-team-0.0.5-linux-arm64.tar.gz"
      sha256 "35f9d0dbe33e6199cd63f14ce7168dd43b1aff3f5a80825dff4246ff0cc365dc"
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

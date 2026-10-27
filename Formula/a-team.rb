class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.103/a-team-0.1.103-osx-arm64.tar.gz"
      sha256 "8a6715a1f6bcaec408f3d8af5a7c971331e5b208293c0a480e5d65377aa388e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.103/a-team-0.1.103-linux-x64.tar.gz"
      sha256 "bb54a8ee8e0f2458d30ec30afb55167d6342d1f896c34728ee58353278499e74"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.103/a-team-0.1.103-linux-arm64.tar.gz"
      sha256 "3909d57727e8dc772cbc1059b814fb5b8520e6f8839ec0062de04bec1bb7fd58"
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

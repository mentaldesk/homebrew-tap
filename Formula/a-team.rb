class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.90/a-team-0.1.90-osx-arm64.tar.gz"
      sha256 "91df75ba0c51ba7530cbabb466525aeae41882566a685b588edc25b6b9102f63"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.90/a-team-0.1.90-linux-x64.tar.gz"
      sha256 "1252e560c79ed77194b52cc171abf87f2ed92ce950229b1d4faac41900e18f8f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.90/a-team-0.1.90-linux-arm64.tar.gz"
      sha256 "ee39d6c64199a889c0358998a99ff4f7394d74c605ccebc17e3145042b6d07b1"
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

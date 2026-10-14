class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.66/a-team-0.1.66-osx-arm64.tar.gz"
      sha256 "1f3b63257cfd1ac2be62e796e59ce005990b12bfd25103071783d85f21f0e3f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.66/a-team-0.1.66-linux-x64.tar.gz"
      sha256 "b8dfafc9851c94c3c2f1052f9e1139833ae4c40aecf89a358e8d2ae9536fb40a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.66/a-team-0.1.66-linux-arm64.tar.gz"
      sha256 "9633dea2ff850e68166369dae2f19eff0b6271d1104193335f93cd7e6f71bf1d"
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

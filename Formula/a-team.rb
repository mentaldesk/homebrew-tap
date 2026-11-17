class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.19/a-team-0.3.19-osx-arm64.tar.gz"
      sha256 "67162695e3557a3f9fb940eb46849a6ef4bee54e76d1579c66a35f854aae59b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.19/a-team-0.3.19-linux-x64.tar.gz"
      sha256 "22256811833eee65d8ee28e5db50c793049fd088e3e68ee228eb82737db03bde"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.19/a-team-0.3.19-linux-arm64.tar.gz"
      sha256 "0a87ce6b070f5c77667a7f22c608d03b16efd12c488b00240feefceca835d5f8"
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

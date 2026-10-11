class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.54/a-team-0.1.54-osx-arm64.tar.gz"
      sha256 "853f8a1b4b99fc7d4c55ba5efb2fb1145062157789aa58a17acb17ff8c6cf1fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.54/a-team-0.1.54-linux-x64.tar.gz"
      sha256 "e9f4643160204b8a0ca31e3463935931b52ab70eade0d514737d42528d48f682"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.54/a-team-0.1.54-linux-arm64.tar.gz"
      sha256 "32aeb17ab831491fdb180634258a845f0bed90a9ffae2069a967caef633f53cd"
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

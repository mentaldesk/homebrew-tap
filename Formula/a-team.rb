class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.1/a-team-0.0.1-osx-arm64.tar.gz"
      sha256 "929e4432646299be865269ba42f9ea07521d1f8bbfd78e3e0c20fec28918c674"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.1/a-team-0.0.1-linux-x64.tar.gz"
      sha256 "4a1d363c90b751a6e98eef4a26fff4653d953dbc79ac0a37a579c4293f723436"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.1/a-team-0.0.1-linux-arm64.tar.gz"
      sha256 "4a2fb57df79fc60259cbcaecfec79e5c4f5168c3687cc7fc6ab907ee61e1b044"
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

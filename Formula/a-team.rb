class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.33/a-team-0.2.33-osx-arm64.tar.gz"
      sha256 "84fd3cd6bf78ab65311275164baf58ea15ae3874738e60f96e23395ef569efd8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.33/a-team-0.2.33-linux-x64.tar.gz"
      sha256 "0b324eb5c9e76a0d0bf87adcf489db869e1c7b78ec5955b8a8305b117dd59e95"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.33/a-team-0.2.33-linux-arm64.tar.gz"
      sha256 "74f13db6dfa2315a2131ebe4fd81a00417aa8d99ccd6f0bb86a771988587b410"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.18/a-team-0.2.18-osx-arm64.tar.gz"
      sha256 "3e8775015ce87796b3d7e75d2ed531517537c9f42db3aebe0a43eb53f530553e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.18/a-team-0.2.18-linux-x64.tar.gz"
      sha256 "70351d37fe9e28e3aba01cf2e9e5ffa26d6ffd8a98016b7c54d874114118b659"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.18/a-team-0.2.18-linux-arm64.tar.gz"
      sha256 "dd95666668cf0fadc202cc00301d005c61d4eb5149af31dbefe5feb07a6f418c"
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

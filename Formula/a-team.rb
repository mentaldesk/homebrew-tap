class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.73/a-team-0.1.73-osx-arm64.tar.gz"
      sha256 "b379f4e44003da2ae4d30a0ebe5d11c99df9cf4a116a11be335041829de47e9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.73/a-team-0.1.73-linux-x64.tar.gz"
      sha256 "55edc5ab874b154946a52add2586b995c37e51b035b5cb756b4bd3daf952804b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.73/a-team-0.1.73-linux-arm64.tar.gz"
      sha256 "cd7f1cfdf3a168bad37ced716e11a51d876ba0f1e8e1c47c9248020d5a407826"
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

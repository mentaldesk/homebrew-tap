class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.27/a-team-0.2.27-osx-arm64.tar.gz"
      sha256 "5fc9d9b88c409828c145d6fd2e63b65ac757a49fc063d88f59bd4991d1cf0d0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.27/a-team-0.2.27-linux-x64.tar.gz"
      sha256 "71d5a25ba544831f0b25c97d27f733adf1ce83282654a0e2bc5fdfde8ac35437"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.27/a-team-0.2.27-linux-arm64.tar.gz"
      sha256 "ab555f2ef0bfa672dd156c691015b50921b128c0db2424b73b8c5f7b1083b62b"
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

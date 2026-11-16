class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.15/a-team-0.3.15-osx-arm64.tar.gz"
      sha256 "fc0cf783a2f87983ba53a818830b6798f9ecc696500e893a2e0be588e966bfd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.15/a-team-0.3.15-linux-x64.tar.gz"
      sha256 "35c63748540735975d4b6dd838c6cb2da1b5ea8bc63d8c4f7e4807e62d0dbfad"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.15/a-team-0.3.15-linux-arm64.tar.gz"
      sha256 "ed322fd688ac71360388bd7a1ad10861c07aa538494d15f15f9ee73925421c83"
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

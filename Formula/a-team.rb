class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.22/a-team-0.3.22-osx-arm64.tar.gz"
      sha256 "9e24d6baf8f8cee1beedbad898d19f948aac0addfc6e7672957fb2bac89e430e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.22/a-team-0.3.22-linux-x64.tar.gz"
      sha256 "76eaa3680217660566250b02057a9f9981a7b7836070f4012c9d4a62f36441c8"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.22/a-team-0.3.22-linux-arm64.tar.gz"
      sha256 "5223c763857982549adaf09c92b7f40491f9571748db7da6a5160e650bc753e0"
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

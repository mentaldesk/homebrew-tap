class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.11/a-team-0.3.11-osx-arm64.tar.gz"
      sha256 "10f8eb0db57971195480ce55aa29ea880c4601fb4ad6c65125f2f6ee623b68e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.11/a-team-0.3.11-linux-x64.tar.gz"
      sha256 "0f46c298567e00d02e6dc05065a32f80f86ef3dd3a564e8bf30058b6ebac49fa"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.11/a-team-0.3.11-linux-arm64.tar.gz"
      sha256 "432726e9e75d886bf6869e6978c66e2a8c9248bb4b88f5d99e5b828be5c4b24c"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.2/a-team-0.0.2-osx-arm64.tar.gz"
      sha256 "fa472fc0c5af97e77fe8f538666fdeb6f986b38b2a3755732764ef5b7cffe5bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.2/a-team-0.0.2-linux-x64.tar.gz"
      sha256 "bd63b7f88c742c8f8a11e5081219b2661b3787398e45dadc759b008f14f7721c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.2/a-team-0.0.2-linux-arm64.tar.gz"
      sha256 "7a4b7c442c742ab266af5cec0b905b7a7f7ccef3990cc996ad4b4af4dc93ea77"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.63/a-team-0.1.63-osx-arm64.tar.gz"
      sha256 "a628022eda1c18bb4e4d2b48101c2a326d86f902e00ef303c8ad9efef4e7df57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.63/a-team-0.1.63-linux-x64.tar.gz"
      sha256 "6101d2409b51756eb0d757e39b911eab6fc65d0f804fef6d45c939b3945f7936"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.63/a-team-0.1.63-linux-arm64.tar.gz"
      sha256 "007850dd411136566cda8a543f8183fc52ed6c50a8edff31790af92ad0ae1adc"
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

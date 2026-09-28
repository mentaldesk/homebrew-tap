class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.2/a-team-0.1.2-osx-arm64.tar.gz"
      sha256 "a332ae54a667019a75e0a85f6bf0ae20eeb09652f7df60e8f1a0877af10ca8e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.2/a-team-0.1.2-linux-x64.tar.gz"
      sha256 "894e662c93ac023871fdaa564449d45d9a2f56f4fd776e3554faee9a2a585fa1"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.2/a-team-0.1.2-linux-arm64.tar.gz"
      sha256 "34d1124290b8bed116cc0ae3c5691c90e200dc90f09f0fae3bb7722a0a8dac5e"
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

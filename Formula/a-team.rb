class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.97/a-team-0.1.97-osx-arm64.tar.gz"
      sha256 "06b64f72ea2320f64707d6ca4008ddf7d141cc73000af59ae5cca1052d2be0a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.97/a-team-0.1.97-linux-x64.tar.gz"
      sha256 "be199772b573b8c1a53c0e9794473950a8a9dfb000e4d59a78c028a363020d64"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.97/a-team-0.1.97-linux-arm64.tar.gz"
      sha256 "14390bcab0b96a7953056ebf2ae4b3c4b4fed999a2897bc191018f30e1b8c0b0"
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

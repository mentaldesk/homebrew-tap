class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.19/a-team-0.1.19-osx-arm64.tar.gz"
      sha256 "104efdc71f7d2d611a37bc9c02724267e893498bc7138f47d46380e0b50c5f31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.19/a-team-0.1.19-linux-x64.tar.gz"
      sha256 "e38dcfaa30f8807b626336be432813f4daf56dfefb4246c1481f078d43475f2e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.19/a-team-0.1.19-linux-arm64.tar.gz"
      sha256 "1675c60aa80de671eb739edc9329286d5ed1319e327efa38e980b1d2b2d178f6"
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

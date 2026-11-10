class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.61/a-team-0.2.61-osx-arm64.tar.gz"
      sha256 "f94520756b9559164d0613996d50d4baa4b48588aa683a237d67ce9cccce7846"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.61/a-team-0.2.61-linux-x64.tar.gz"
      sha256 "3d5461f73d96bd48b7eba6d6fe45a1be33f706d98f9a543ee934a37ce264603a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.61/a-team-0.2.61-linux-arm64.tar.gz"
      sha256 "a3c2bd2d76a6a3fbc69e912df32935a8c0ab90d9a38b94df846ababd6f573e62"
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

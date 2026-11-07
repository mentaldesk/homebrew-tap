class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.38/a-team-0.2.38-osx-arm64.tar.gz"
      sha256 "00aa01328146b30b944c5c55ef4b17ddd8f10af6727e69fb335a22900651e4e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.38/a-team-0.2.38-linux-x64.tar.gz"
      sha256 "aa3f49aa19a8880e85ade5bee365c176aac09cc36445b336cfb43ad9d3a11527"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.38/a-team-0.2.38-linux-arm64.tar.gz"
      sha256 "66d8f38d700fbebc07884355d867eb04dc99ff481c1ee5fce1dbaf2babfd0546"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.22/a-team-0.2.22-osx-arm64.tar.gz"
      sha256 "070b39044ee6110b24f8080df7d69197bf5d39761d3317af1874c775c6aa56dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.22/a-team-0.2.22-linux-x64.tar.gz"
      sha256 "7a0c8dc00a8c6520651c3dd9a3465d039a426beb63abfe4ba2a2cd03c1e470b5"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.22/a-team-0.2.22-linux-arm64.tar.gz"
      sha256 "2c9a1cec72ff684660bcf1ba35a52fc11e02e0b1d412ce61c9e3f47a8f2e6b30"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.3/a-team-0.0.3-osx-arm64.tar.gz"
      sha256 "8e8f73f36ba0787006d612b8c9944a6c2d0d5d3ce738987700d2511250e17262"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.3/a-team-0.0.3-linux-x64.tar.gz"
      sha256 "0744072edb4d5428ef4de06d1a2c3075f8ca4054ad560e7c08c14d77c9a93fde"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.3/a-team-0.0.3-linux-arm64.tar.gz"
      sha256 "2acbc07e3a3f7b772158922253ecf4b28a19fcfd8bc3052791d27f74023942ff"
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

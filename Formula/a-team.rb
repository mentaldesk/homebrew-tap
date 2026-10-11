class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.46/a-team-0.1.46-osx-arm64.tar.gz"
      sha256 "99278e13b406e36c1bf7ccd842a13649d504093eaa549648fdc82822fd26f51a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.46/a-team-0.1.46-linux-x64.tar.gz"
      sha256 "877d880fb75d0d1c86600f7bdb1f917fca5d02f57d811e7547f0a73da36b0622"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.46/a-team-0.1.46-linux-arm64.tar.gz"
      sha256 "2043e6eeee1ddf014c0beaf15dc1f82881ca4fa4daa869974d7c90acb1d89ea8"
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

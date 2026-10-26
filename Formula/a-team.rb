class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.101/a-team-0.1.101-osx-arm64.tar.gz"
      sha256 "1c5dedb03068d7c09b27dceb8c2ff2719221f9e02dfdea78097d2d729b16039f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.101/a-team-0.1.101-linux-x64.tar.gz"
      sha256 "2561d25ac2748eeb39d948136bd4f993e124461e4b905b367042d2930e8bbd39"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.101/a-team-0.1.101-linux-arm64.tar.gz"
      sha256 "ce4ef2e1a754bcdd9558cb0d115caea3f5167c8f74b93493b4cada920d38ef33"
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

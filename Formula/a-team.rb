class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.36/a-team-0.1.36-osx-arm64.tar.gz"
      sha256 "b92b1f2250d1a7247b9cb0f19f4345c2d8b9a77da90e744e4f7cf0c2e1683948"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.36/a-team-0.1.36-linux-x64.tar.gz"
      sha256 "2ae8ed04faf3a2f0e41aa35c818185d4ba8e84fcc52ac4860e7c6912d2b72831"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.36/a-team-0.1.36-linux-arm64.tar.gz"
      sha256 "5a29134910aff0d2fbd28f7c19a14489e9fb847903322a775df8b941c6ab4ba7"
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

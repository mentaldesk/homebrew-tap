class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.13/a-team-0.1.13-osx-arm64.tar.gz"
      sha256 "15bdb068e94a32e4bdbd8e5c429617cce5f86b63f5f03cad5eb8ac429a0fffd0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.13/a-team-0.1.13-linux-x64.tar.gz"
      sha256 "3e86eb7694f08d6624604e42e9ad8eb8c5af8ce74951a2c0aabf9a0a423e3d0b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.13/a-team-0.1.13-linux-arm64.tar.gz"
      sha256 "d7408da8b116fd3811ebecff7fd8eb3ea250e44e4830abe1dd210579ee056c69"
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

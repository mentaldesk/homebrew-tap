class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.53/a-team-0.1.53-osx-arm64.tar.gz"
      sha256 "97eba5fc95467a11ee5f009443e413ca5bc47a50fde6a5e0f290a2e2762cedc6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.53/a-team-0.1.53-linux-x64.tar.gz"
      sha256 "4bfcb3203c17e6b146ac4cc7c3bb0e1685442db1f015bb17896ab47f9ea794a0"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.53/a-team-0.1.53-linux-arm64.tar.gz"
      sha256 "80c4f2cbebf4e750b5c1090204d4f55f1a682e7e3f61a06620dda02ee1057cc6"
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

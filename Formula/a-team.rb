class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.14/a-team-0.1.14-osx-arm64.tar.gz"
      sha256 "6ddc423c211909fde93207e310e248d90702154140ed02cbab946eb61519014e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.14/a-team-0.1.14-linux-x64.tar.gz"
      sha256 "d732ff1b8c66398772dfe891998b0d786e5f0a374f82c96c29b87c299727319c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.14/a-team-0.1.14-linux-arm64.tar.gz"
      sha256 "f5c3f82de1cd20f29bf7bd2dc484dd75370c058ba1f83b9f104a4de6e88cb203"
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

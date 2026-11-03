class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.17/a-team-0.2.17-osx-arm64.tar.gz"
      sha256 "9ad02ab094ee8eb3aa5cc2786742b0f2d0ca93450e04cf35cd615cdd4b1ba5d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.17/a-team-0.2.17-linux-x64.tar.gz"
      sha256 "c808a27d3ef18d9db0b2dec803fe45ba58540a65b501c1bebb2773f00c4a8c13"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.17/a-team-0.2.17-linux-arm64.tar.gz"
      sha256 "c57eef0461becbde4694edaada4801fbb7b38bb2a30aa1ce9466e868488fbdb6"
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

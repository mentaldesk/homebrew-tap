class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.27/a-team-0.3.27-osx-arm64.tar.gz"
      sha256 "9a44cc68d17a395fe9615c5646878de5d411738711f7e4d2130e34dcf17f86de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.27/a-team-0.3.27-linux-x64.tar.gz"
      sha256 "4518ccc557972a81596097b39c72f54a1968f4ba139a318db0250869b4277030"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.27/a-team-0.3.27-linux-arm64.tar.gz"
      sha256 "fa4e4d1b97fb0eed4fdb8ce3b14651a47bcdc11f2ae365c323b0ccad72b5ee02"
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

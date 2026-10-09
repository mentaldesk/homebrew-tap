class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.39/a-team-0.1.39-osx-arm64.tar.gz"
      sha256 "166b8cd3e5adae0a598173cda604b8fabca3d8c1626b36807d5241898a29de98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.39/a-team-0.1.39-linux-x64.tar.gz"
      sha256 "e63e1895046774cea38c747b0aa68f65c70b19000514a3082aeead7db4769920"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.39/a-team-0.1.39-linux-arm64.tar.gz"
      sha256 "3f904dd3db64c81f81c6d2a1fb2d778b6769384859080774a9e0a061d7fcdd0d"
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

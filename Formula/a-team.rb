class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.12/a-team-0.2.12-osx-arm64.tar.gz"
      sha256 "82c02f0d0edc0dbe98dec62bb415d6f149cfe9407d000883c59cc461a5d34122"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.12/a-team-0.2.12-linux-x64.tar.gz"
      sha256 "e9c4600bb9b5b8bee95172871b2c76f25185d06e0640d8b7af743f5be28244a2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.12/a-team-0.2.12-linux-arm64.tar.gz"
      sha256 "9e6ab347ccd9f2a5a2e57b51c4cb4c57bf68665b0178eadd68440c07aa295afb"
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

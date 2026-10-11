class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.51/a-team-0.1.51-osx-arm64.tar.gz"
      sha256 "3e414587e1dac9c94c43c852e7143b6f9a08de68b6833d2b47c9d59498802586"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.51/a-team-0.1.51-linux-x64.tar.gz"
      sha256 "a677720953c54ab428169ede28a05c7162b4033179b8468a1b967494e0c08ce3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.51/a-team-0.1.51-linux-arm64.tar.gz"
      sha256 "e7496df284dd4cd2c1f9a6c71ae38bef83961f1a08a286162709bd4e8621a175"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.27/a-team-0.1.27-osx-arm64.tar.gz"
      sha256 "2b52c5d725f53c88a727b18941fbcfe4bfd384d17b23ea4a5e23099bf153daa9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.27/a-team-0.1.27-linux-x64.tar.gz"
      sha256 "4ad8b6aa31a1386f8e88c4ecb871461e508cab0b3f020bd5b0e006422b141046"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.27/a-team-0.1.27-linux-arm64.tar.gz"
      sha256 "a1b3165fb509f1ceeed6c4cb959d65ff98944bc638b8e0a5b3d57593505283e4"
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

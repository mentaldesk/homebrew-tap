class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.33/a-team-0.1.33-osx-arm64.tar.gz"
      sha256 "4c8692260027380ffed620f024ef2a9c27cb9fb08e67450c65cde3b6cd02f221"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.33/a-team-0.1.33-linux-x64.tar.gz"
      sha256 "ded6d000a21c7bcf97a574fa0f74e86137b7cbf0e35cff01bb2d43ee86278cf9"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.33/a-team-0.1.33-linux-arm64.tar.gz"
      sha256 "9ae747206e493d83e0e01f390d5d5cc97349eaa96582b83038d5fea6e95e1adb"
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

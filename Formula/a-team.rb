class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.95/a-team-0.1.95-osx-arm64.tar.gz"
      sha256 "c4e55f840e0c2f0f2f5ca084a823351ecfc862c8ce7758f7df212a36ccfa6aae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.95/a-team-0.1.95-linux-x64.tar.gz"
      sha256 "073e2088f5611098e241faf770ca7a41a32365c86b4f36a6e0e1bf7d90c052ed"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.95/a-team-0.1.95-linux-arm64.tar.gz"
      sha256 "cd89d57d7eae5631f8a15c84367282f3438cabe0649312da9097b72d4d3ed7e7"
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

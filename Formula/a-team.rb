class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.75/a-team-0.1.75-osx-arm64.tar.gz"
      sha256 "b83e4f28fe9df18af14dbb6f14013dc5bbcfa69406a3f3682898d27ee8c5d8b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.75/a-team-0.1.75-linux-x64.tar.gz"
      sha256 "38913220667a0114ae985c0177fc85cbd61585db2b31f1db2256bcdd44954851"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.75/a-team-0.1.75-linux-arm64.tar.gz"
      sha256 "32e0f1cb0b21a0cfdd1fa41c9d65f47f11c59fadfd49dd63d6c661800e1c5d79"
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

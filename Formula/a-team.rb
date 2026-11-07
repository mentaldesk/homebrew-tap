class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.47/a-team-0.2.47-osx-arm64.tar.gz"
      sha256 "108bcf932bf60768acfa01903e6553039b93790ae5d4f733db164cfd2986aeb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.47/a-team-0.2.47-linux-x64.tar.gz"
      sha256 "22a40cb5c77d6d51004484875ae7fb6d69f7d9409f73535e29fbb0aeedc7bbfe"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.47/a-team-0.2.47-linux-arm64.tar.gz"
      sha256 "a18c9a47ad035350548914f82a9dc53753856d1362102530651f6ddf11f7b8aa"
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

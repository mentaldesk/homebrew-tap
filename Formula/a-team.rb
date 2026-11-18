class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.21/a-team-0.3.21-osx-arm64.tar.gz"
      sha256 "f2f1dd2dea818477165184e1374689d2cdd2831ebcf5a66ae9e32065e8b174f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.21/a-team-0.3.21-linux-x64.tar.gz"
      sha256 "44dc4b44d585297a5fa61d02d01b57e22eda17231692949ae99f77fd8bf63469"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.21/a-team-0.3.21-linux-arm64.tar.gz"
      sha256 "92e2822b23d6a9a9694013ee8a3a8126c26da3e7b9cb423eecfaec329b4aee3b"
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

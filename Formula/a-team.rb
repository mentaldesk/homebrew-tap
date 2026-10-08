class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.23/a-team-0.1.23-osx-arm64.tar.gz"
      sha256 "c2b1981744d2ce498ffb86b07a4072cbd1ee633dcdbe2a2d1417cf27645caf62"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.23/a-team-0.1.23-linux-x64.tar.gz"
      sha256 "ac80a3c6ff375aa6e07cceafe919c69dcd052eaeb3863c1872bcb0f494a14e92"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.23/a-team-0.1.23-linux-arm64.tar.gz"
      sha256 "bb047c5421bfc0a82825f791c76f397f73eec0f48df4170e3a6c125adee6f54a"
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

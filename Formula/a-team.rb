class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.43/a-team-0.1.43-osx-arm64.tar.gz"
      sha256 "efef44cddc4db3649d965241f63d25b8b7544a3f5b7303df99fc971ebb40a3ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.43/a-team-0.1.43-linux-x64.tar.gz"
      sha256 "38f90c54d2a63da6d4ae304b3f32959b232c9b8c3c25163ab2e6b760a7440b76"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.43/a-team-0.1.43-linux-arm64.tar.gz"
      sha256 "cc3b57da0a970783530269304e88e3ca3efe4132ab2fb7eda132f8ee2a17e974"
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

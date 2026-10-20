class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.89/a-team-0.1.89-osx-arm64.tar.gz"
      sha256 "80883649980624fb90b04d400a784ed6db2252edb50af67a27be9638b58473b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.89/a-team-0.1.89-linux-x64.tar.gz"
      sha256 "a6ba9e660f3b8998454a2806b0565b46c005f4412914315d865cd0fb08efc33d"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.89/a-team-0.1.89-linux-arm64.tar.gz"
      sha256 "8af8cfb7669f7eed745fc9968665aa303f5939c5fc88b235721c84377d1bebff"
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

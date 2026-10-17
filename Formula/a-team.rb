class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.80/a-team-0.1.80-osx-arm64.tar.gz"
      sha256 "275c0b3ce5c58feeec63da785eb174b4dffe83051f681506b606f13eabf475ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.80/a-team-0.1.80-linux-x64.tar.gz"
      sha256 "6b796b7c751b339a9cda6c09fa142c6912a73ee00b6f1d5d12c08c719a9376bd"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.80/a-team-0.1.80-linux-arm64.tar.gz"
      sha256 "2f92b1161d4421d387b2cf8de186792ef7ca245daf46714d39be8175272f193a"
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

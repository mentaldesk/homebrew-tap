class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.31/a-team-0.3.31-osx-arm64.tar.gz"
      sha256 "78157b70fe10b8b910d08bffc932ba093cd56403fa33594696f1645af8785998"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.31/a-team-0.3.31-linux-x64.tar.gz"
      sha256 "5817b1568b04a8530755c18d8e8f8977610888d67771a175b89d720ae9b9c0b5"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.31/a-team-0.3.31-linux-arm64.tar.gz"
      sha256 "b549e28dcbc5bfe23b64de94f1ab2a610302a89f1e00cdd92f8056ab8c05bda5"
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

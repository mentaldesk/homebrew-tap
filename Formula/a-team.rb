class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.9/a-team-0.3.9-osx-arm64.tar.gz"
      sha256 "4aa222a2a1d5fc76db4fbf2931f2fa2395a14f72973b676ae242a0077fc66fc4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.9/a-team-0.3.9-linux-x64.tar.gz"
      sha256 "d6e705ad43b44234d2a97da37aa477b3bb4050f9afa2eba7e49084b53662b9bd"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.9/a-team-0.3.9-linux-arm64.tar.gz"
      sha256 "271b807d247c26de7429207c28b0cc6acc7265dbf6e3048fa68f162ed0f570aa"
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

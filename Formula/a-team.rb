class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.29/a-team-0.2.29-osx-arm64.tar.gz"
      sha256 "769d1c9190129105f67f9d976e1beea899993ef7b39cd5195891b9e199153865"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.29/a-team-0.2.29-linux-x64.tar.gz"
      sha256 "b9a3435159b90c47ef46c4f5c94eba39c50eccc98ad113078842872119fb11a7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.29/a-team-0.2.29-linux-arm64.tar.gz"
      sha256 "64309c0c6f1c02516cf2b835ba2fc9ec8515fe90a5316e12f5b549164d97485b"
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

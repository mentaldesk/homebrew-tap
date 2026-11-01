class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.10/a-team-0.2.10-osx-arm64.tar.gz"
      sha256 "f193d11d70ee74cde41b70d402f26a206000f42f667a2055a4012b5139d82dec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.10/a-team-0.2.10-linux-x64.tar.gz"
      sha256 "164b4e2d9c1c80e55400221bfa43f983d735d755194313b4eca736a142ff896b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.10/a-team-0.2.10-linux-arm64.tar.gz"
      sha256 "e684e6c7eadd3d54c748010e318b712cf0ebc6e74be75997c818dbd15db13fae"
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

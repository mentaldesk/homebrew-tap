class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.12/a-team-0.1.12-osx-arm64.tar.gz"
      sha256 "b46887b7452a5c50f6ef5b90f59374acf6199a4e3e7b8af77004fbf1bf011a9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.12/a-team-0.1.12-linux-x64.tar.gz"
      sha256 "1364d80590a6d41bebab69d746f8c4a5e794062a4e08a3e5b43e9ba93a659dee"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.12/a-team-0.1.12-linux-arm64.tar.gz"
      sha256 "d79d0139df9a8149ecdc2525ddcf9acee1c52ee1402dcfd8fd4a4f1700fa8ed2"
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

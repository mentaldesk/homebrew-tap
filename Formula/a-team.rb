class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.60/a-team-0.1.60-osx-arm64.tar.gz"
      sha256 "bd0aaf68b730ec413b98924ca97fcb7b560463ae0ee18e4a87856420084da39d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.60/a-team-0.1.60-linux-x64.tar.gz"
      sha256 "8a7ef7179448188b677e174287438a40ac06de21db7b2bdec4d26e16dbc150c5"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.60/a-team-0.1.60-linux-arm64.tar.gz"
      sha256 "298e1be80558dd31804cfc0b9ebadbf13b6cdc1de9963ef37d471d872b092d6b"
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

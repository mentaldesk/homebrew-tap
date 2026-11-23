class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.30/a-team-0.3.30-osx-arm64.tar.gz"
      sha256 "9971180e2c75e5f53d50aff06fd17fcb2ab1a5f60245dc99e25bcb32a3b5b882"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.30/a-team-0.3.30-linux-x64.tar.gz"
      sha256 "1bda5e0117fa52a63c4b00728d956cbf3bb0e29e3f2ce369180307400e577e27"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.30/a-team-0.3.30-linux-arm64.tar.gz"
      sha256 "0b16fa38d4cb813c79017bea9d61ddbad64be0f7915fa28a370277d415cfc19d"
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

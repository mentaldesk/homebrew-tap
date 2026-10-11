class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.48/a-team-0.1.48-osx-arm64.tar.gz"
      sha256 "d18aed1f6ebb6a4264fe8cdb4ff053fc234fe79ae2bb4902ab6a28083a149b42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.48/a-team-0.1.48-linux-x64.tar.gz"
      sha256 "555c4dc79238da886bb8e13902ea303036842f4f946d7a5e820873da7ab3ecb3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.48/a-team-0.1.48-linux-arm64.tar.gz"
      sha256 "6344d2cf8c80bf74ecc798887431388a6c7e1b2109d3561001104febc86d7e1d"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.5/a-team-0.3.5-osx-arm64.tar.gz"
      sha256 "782cd6024149573ec303b00793ad50ed8e79ca6fc5ea7e6b47400081e10f84fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.5/a-team-0.3.5-linux-x64.tar.gz"
      sha256 "7e7b88efcba1093eb9305c3ad8c3c49f229744bd6308c8f13c1e4f9ba1945fee"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.5/a-team-0.3.5-linux-arm64.tar.gz"
      sha256 "97053802bbc3793103ff9f3db429ba618df6272ca2912fe7f1df942bf94a23f4"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.65/a-team-0.1.65-osx-arm64.tar.gz"
      sha256 "3215b3080ea309d90f4eecd83a8b08d19ef8859c9f195a0b8561c5e597e6dd83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.65/a-team-0.1.65-linux-x64.tar.gz"
      sha256 "b170c847d1d2e2f680b35deb3ba77e82c4ef30061fc2bae8f1670f357813a163"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.65/a-team-0.1.65-linux-arm64.tar.gz"
      sha256 "4d914f4ec71212ad7490bb18949caa869503e3423666d5838e1d8fe52f3abe4b"
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

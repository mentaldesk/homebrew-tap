class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.84/a-team-0.1.84-osx-arm64.tar.gz"
      sha256 "023f720d3336ff14b85d87adb87753830ebfbf43743bb44829a894d5f2cd8885"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.84/a-team-0.1.84-linux-x64.tar.gz"
      sha256 "9985b73be2b8489623e26629767e68df76a9552c58a52839c0af16cc2ddacdb2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.84/a-team-0.1.84-linux-arm64.tar.gz"
      sha256 "809d8d1eef32ebc19636d3f7d0acaab7c1478770f03f54c423ed2882f9dc6699"
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

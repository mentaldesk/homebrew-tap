class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.40/a-team-0.2.40-osx-arm64.tar.gz"
      sha256 "3a672d20dc76af8a75030e6165f88930b344e2a583940eaf153854a8676345c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.40/a-team-0.2.40-linux-x64.tar.gz"
      sha256 "18053b316dceb1242babc98625181e1605e93e60443a4e7d6252ed47a0483a5a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.40/a-team-0.2.40-linux-arm64.tar.gz"
      sha256 "e42248822eff65c0bd94c20b2e230f4fa049aa7651da1484d83203be50e7a6a3"
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

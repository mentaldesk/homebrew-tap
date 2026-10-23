class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.98/a-team-0.1.98-osx-arm64.tar.gz"
      sha256 "37a725f59b01791d35c6011df76a2c4bfeb70c8dc3157788c68580d20eb9c1df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.98/a-team-0.1.98-linux-x64.tar.gz"
      sha256 "742a5d863b1d925a7ccf617db2016a38f1e602fae1cf436805d170a330a7a36d"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.98/a-team-0.1.98-linux-arm64.tar.gz"
      sha256 "ccca1db08e33b43ffee074577d6891215c11d55365bab7c9c622ff17d6152b87"
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

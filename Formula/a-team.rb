class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.35/a-team-0.2.35-osx-arm64.tar.gz"
      sha256 "4471d37625a310f94c358236d92465aa10a19107d53e8d7375ab6bbf0fe5cd5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.35/a-team-0.2.35-linux-x64.tar.gz"
      sha256 "773fb81733805f2259bf18b2e1acde395acece13233cecf768d1e38e21db617c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.35/a-team-0.2.35-linux-arm64.tar.gz"
      sha256 "40a50f9f8598fe5074bdcc0f82198601f29acbe8c4a05a984eaa6b3584dfa2c8"
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

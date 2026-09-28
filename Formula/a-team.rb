class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.4/a-team-0.1.4-osx-arm64.tar.gz"
      sha256 "446377498b9107b91158cd741ee0581353556f5e40f7ac2d05c38bb692bba66e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.4/a-team-0.1.4-linux-x64.tar.gz"
      sha256 "0040ae24baa9d1b7f43c9253a7475cb2038c779327e22a1a4d5ad7b9d6a24ae7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.4/a-team-0.1.4-linux-arm64.tar.gz"
      sha256 "51e87f932da9ae131225d2e713b667a511b70ce0bc861fd68ea1b21c8a1de879"
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

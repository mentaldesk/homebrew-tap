class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.31/a-team-0.1.31-osx-arm64.tar.gz"
      sha256 "e476847d3a2b245c68ed60c0094ac8fb32da808164be27c97f4aa0469ca98548"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.31/a-team-0.1.31-linux-x64.tar.gz"
      sha256 "097106c8dd87aea609067c889c430ba86e42c9e60bc7e1ca7ddf5103ffc3a0cc"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.31/a-team-0.1.31-linux-arm64.tar.gz"
      sha256 "152fcdb9e57433a3b9a3ebdcc80798a0e120a910caebaab76654d96fd25b12a8"
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

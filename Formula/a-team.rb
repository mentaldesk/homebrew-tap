class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.41/a-team-0.1.41-osx-arm64.tar.gz"
      sha256 "61543f29422429b4acfbb7018629341c0d68af2550f7c118e26355580b68abd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.41/a-team-0.1.41-linux-x64.tar.gz"
      sha256 "5362ff46aabc43caa25ae94269457d6334a008e06e982eb74e2948216f99a883"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.41/a-team-0.1.41-linux-arm64.tar.gz"
      sha256 "9feba32f346ca61e1a3557bc99629327330a0dd793aa75cc2b1028bf0ea34ef4"
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

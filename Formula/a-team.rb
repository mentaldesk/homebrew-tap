class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.26/a-team-0.2.26-osx-arm64.tar.gz"
      sha256 "8d7adf1389b2c99f1a9a091036aa39365568a52f4a4875abe072f0b8cc928221"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.26/a-team-0.2.26-linux-x64.tar.gz"
      sha256 "8b0092a1e98bdde11efe0f5a96d0015c3aef43ee520f689a5ee21f62cb9da74c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.26/a-team-0.2.26-linux-arm64.tar.gz"
      sha256 "4784efe772e797d3bd8f980ee534730b3d5ad765dbf093558f51c4cd01ad6b00"
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

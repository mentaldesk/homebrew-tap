class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.18/a-team-0.3.18-osx-arm64.tar.gz"
      sha256 "17be95666765909f2c6ea09211c9391584a001d90e0bacb231cb78775a671776"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.18/a-team-0.3.18-linux-x64.tar.gz"
      sha256 "d36f89174fd01406d118d84860d223d75e7dec95d324ee25e881c4c04139d3a2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.18/a-team-0.3.18-linux-arm64.tar.gz"
      sha256 "8824efbfd7d7e0acc47edd7438b4579611d4adead28b3a367a347551286ce8b4"
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

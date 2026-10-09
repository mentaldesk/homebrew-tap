class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.37/a-team-0.1.37-osx-arm64.tar.gz"
      sha256 "4e29aba1cab00bd825983c45c6b6ec990059ce71e4c1c18784ba9e212439c4be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.37/a-team-0.1.37-linux-x64.tar.gz"
      sha256 "5cdf070e51ebaf767dc2be130e6d518b7de7cc458191e1c8580a357d7c4b63b4"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.37/a-team-0.1.37-linux-arm64.tar.gz"
      sha256 "6934554c3f74581e9aec6fc9352fa4085ea760146ca3aa99d25f7b402bda7439"
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

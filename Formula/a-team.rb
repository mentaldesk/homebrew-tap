class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.16/a-team-0.1.16-osx-arm64.tar.gz"
      sha256 "94e160a3d089be9ba60e6591c05a3926203364c11082635410f85b1151ea7d65"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.16/a-team-0.1.16-linux-x64.tar.gz"
      sha256 "acae1bb81b1d96cf268e7bf04495e511000b3ad49911d769cf5516b16fc6b6e5"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.16/a-team-0.1.16-linux-arm64.tar.gz"
      sha256 "e81a4c03576e2f838d4a1739f9a230cbf543a143a38de47c4d30f3cadec4bc31"
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

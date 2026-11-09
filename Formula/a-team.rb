class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.59/a-team-0.2.59-osx-arm64.tar.gz"
      sha256 "daa609775056417da5603ecedc1d19a5fbff4beeca0ae2f1d3da58a5fa2b6fae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.59/a-team-0.2.59-linux-x64.tar.gz"
      sha256 "a55b8ebe6a7c0c53c0950b2d1ebe7ebbaa5941303a908ce9a76fb46da2b2cc2e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.59/a-team-0.2.59-linux-arm64.tar.gz"
      sha256 "3d38abdc91f29028992062a0ac5e29360d287ce652f1d3b72aa2793c442e76d1"
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

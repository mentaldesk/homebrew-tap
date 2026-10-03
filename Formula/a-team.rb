class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.10/a-team-0.1.10-osx-arm64.tar.gz"
      sha256 "a5ecbb2da4efcda305b47fc946d765a63ad5587f7cfc35541e049c00ce3ab1e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.10/a-team-0.1.10-linux-x64.tar.gz"
      sha256 "639268367801259bdc9626d23653e82334ccbd84078b98ddcd3bead1e68c3e6e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.10/a-team-0.1.10-linux-arm64.tar.gz"
      sha256 "bff2b83cb56541537082f5f0f89665e3701d92d27fbfac24cb718391704abb99"
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

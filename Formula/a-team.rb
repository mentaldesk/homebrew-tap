class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.37/a-team-0.2.37-osx-arm64.tar.gz"
      sha256 "15e23600de579b262bf304619330b3fd92f35afe7a10995b06f66d84c293038c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.37/a-team-0.2.37-linux-x64.tar.gz"
      sha256 "ccad2bf264649e258c17936dad4032ac95459af036746c9d53c792732aa886e7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.37/a-team-0.2.37-linux-arm64.tar.gz"
      sha256 "d5ca9a2000bfcd9954c783615925f9ab9879fefc793fc43cd64c51d4ceeb2220"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.52/a-team-0.2.52-osx-arm64.tar.gz"
      sha256 "51a77da43339ac70d577281098e825e043f49fffbce24538cf3251026e9be4e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.52/a-team-0.2.52-linux-x64.tar.gz"
      sha256 "003716a0da2992192dcae1ca5aed913f0bc0f9c6b3128d10310b2a756572e7bd"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.52/a-team-0.2.52-linux-arm64.tar.gz"
      sha256 "a22e870bc8aa035c334d29608ac65c74f56e5b84a0cf0c8acc14d9842632de82"
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

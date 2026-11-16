class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.16/a-team-0.3.16-osx-arm64.tar.gz"
      sha256 "93a2fcccc498f6643b4e9e6872ffdcfb99ac33506f61789fa0a58bf6057b8f80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.16/a-team-0.3.16-linux-x64.tar.gz"
      sha256 "0cada7cec9bb16b1c3e9aceac53e4c1df0dd721dc741b50a02a4a335c3c37447"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.16/a-team-0.3.16-linux-arm64.tar.gz"
      sha256 "425d4e87dfbf1216220aaa532bbde2b2ffb196f3c10231313973953006722b32"
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

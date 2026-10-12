class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.55/a-team-0.1.55-osx-arm64.tar.gz"
      sha256 "2c1f20eb29950f9f653b670115ce2bd3c4fbe787d79ef4fb8479a0e5d80b622c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.55/a-team-0.1.55-linux-x64.tar.gz"
      sha256 "d2a0c7897500db573708e3f99e0154f7d1214123f266830622d0d5de98fa6c9b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.55/a-team-0.1.55-linux-arm64.tar.gz"
      sha256 "1831031e7882d0a53c6f59f43b80b0f16f65327fda16a1c61e046b95832941b5"
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

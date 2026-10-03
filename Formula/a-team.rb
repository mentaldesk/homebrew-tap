class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.11/a-team-0.1.11-osx-arm64.tar.gz"
      sha256 "c96f9eda97252755c60e223cd397103bcabfcd39e41d584c9f8ba083f76fe66c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.11/a-team-0.1.11-linux-x64.tar.gz"
      sha256 "566683056da87a44bf0cf033aa11448fa2e5ebea8f43170c3d4e2930c0b78385"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.11/a-team-0.1.11-linux-arm64.tar.gz"
      sha256 "48e41dd01d72d02d0c8a53a943a7e4c2a1e71f6f18a6b0e3f0d7618ffe18c74a"
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

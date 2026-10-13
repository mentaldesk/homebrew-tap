class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.64/a-team-0.1.64-osx-arm64.tar.gz"
      sha256 "14d0c85574f17a303aa40cf3bc8cc2fc65ef38cc6e711c04ae8373d7dd9904c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.64/a-team-0.1.64-linux-x64.tar.gz"
      sha256 "6e913bc9d95d12504e19d6bc77731b43996fff7f254c86dd363352a883936d58"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.64/a-team-0.1.64-linux-arm64.tar.gz"
      sha256 "524aa09d84dabe545ee33d9485edc5bb941153c6bae98b30aa4844789eff35ea"
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

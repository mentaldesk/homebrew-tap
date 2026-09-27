class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.0/a-team-0.1.0-osx-arm64.tar.gz"
      sha256 "a4861322749f41d82a0fc0a1048ad44664ba4b1ac8c0d5a4e82b4dc27aec7be8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.0/a-team-0.1.0-linux-x64.tar.gz"
      sha256 "1609c865fc9e470ea2ea6a665dfc535de64ffa53c18f5cb2fe9499271c50223f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.0/a-team-0.1.0-linux-arm64.tar.gz"
      sha256 "a17a6a568adfb0f2bcf6071560515dce5de57b4cd8b3287ad5d88b275e991185"
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

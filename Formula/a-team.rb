class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.7/a-team-0.1.7-osx-arm64.tar.gz"
      sha256 "191d5628bea6d26dc8f7c5f2c2120b30846ff7ea99222cbe74654fcfca4f4d8c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.7/a-team-0.1.7-linux-x64.tar.gz"
      sha256 "e75be5867344861f7214cd9fcc051d7c63fd533e43b74bc8e1122728f12adc12"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.7/a-team-0.1.7-linux-arm64.tar.gz"
      sha256 "2ac78d7dfcb9345c3dfcc67c166c9f01f58fe9154446e248befc0c38d0095aa6"
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

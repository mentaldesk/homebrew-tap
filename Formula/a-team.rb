class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.5/a-team-0.1.5-osx-arm64.tar.gz"
      sha256 "d584b439fcc36621888ede3dc9f2617620546d8fa9fe4e91770e38bcf7367206"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.5/a-team-0.1.5-linux-x64.tar.gz"
      sha256 "16850a2d46084b0269d83e2da53016590b51be5f6fde94125573603220345d13"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.5/a-team-0.1.5-linux-arm64.tar.gz"
      sha256 "4ad67d91ef95635776d96de855cb7f5b5c18fb10379e7c02f78cb8dea982a609"
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

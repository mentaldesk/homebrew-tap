class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.7/a-team-0.0.7-osx-arm64.tar.gz"
      sha256 "d95be434d0c6fef52118656c06ad71c28d13abd618e686ad54183ef017edeb3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.7/a-team-0.0.7-linux-x64.tar.gz"
      sha256 "9fd3da62696f5fc12286af062ed895bbead897411834835f2090c16d31510300"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.7/a-team-0.0.7-linux-arm64.tar.gz"
      sha256 "64d55ab7848ac976a5974f5c4cdaff05252a6a9009498873df070ecbb9aca3cf"
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

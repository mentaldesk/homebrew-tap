class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.19/a-team-0.2.19-osx-arm64.tar.gz"
      sha256 "0e639810dee72095cb9dc8fbb0664adc27090e53efbf817d48977409a59b05fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.19/a-team-0.2.19-linux-x64.tar.gz"
      sha256 "435023c6d3e8fe633443eeb2343c6a103d9091f4f1c06d49a2defce043fe29a3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.19/a-team-0.2.19-linux-arm64.tar.gz"
      sha256 "f46dc19acfd07f339ddb20eff22b928642298c4e3db6be92899487ed2e1ca8f7"
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

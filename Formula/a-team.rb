class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.15/a-team-0.1.15-osx-arm64.tar.gz"
      sha256 "c70ed94892bdf35f28a4b19fe72c822d65fc2c2299efd348d92d51e998f62ca8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.15/a-team-0.1.15-linux-x64.tar.gz"
      sha256 "68ee0186c35d2062ea75db256fbd79c39bfd0d6aeb3269545186892e30737674"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.15/a-team-0.1.15-linux-arm64.tar.gz"
      sha256 "cfb6738b362ef69db2afed4548fd6d94322fbae65d78b94d43c6a8c815b30461"
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

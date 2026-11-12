class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.1/a-team-0.3.1-osx-arm64.tar.gz"
      sha256 "774be42b052a7b8b98dee5516bb617892244f2550a1bea72f1c789dcf92d2ff8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.1/a-team-0.3.1-linux-x64.tar.gz"
      sha256 "80906dcc979a991d36c4abab1ec66937d7e4cb65eabae0e8a31f87cca9af2a4c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.1/a-team-0.3.1-linux-arm64.tar.gz"
      sha256 "389e84fdd7fedf0649b8699b7957acb6ff7591c0683c18a8128130c0ddb200b5"
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

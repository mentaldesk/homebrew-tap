class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.18/a-team-0.1.18-osx-arm64.tar.gz"
      sha256 "8d02b9b77d4bae65e0186d794246816d9a57049edb70895045e8cc40ecf592d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.18/a-team-0.1.18-linux-x64.tar.gz"
      sha256 "cfb2ffce9b5ee13c08e80d7e37fac1c6668f1599003fe261dbbcebcc19fe39b7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.18/a-team-0.1.18-linux-arm64.tar.gz"
      sha256 "0c318690ed98ee10571132ac47688a9483e9d83c6225291bda33ad7f454530b8"
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

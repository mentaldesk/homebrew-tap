class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.7/a-team-0.2.7-osx-arm64.tar.gz"
      sha256 "16192db6f2de54be4183d42172d75c1d1c6d0b2d8af2768cf704544d8b6707be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.7/a-team-0.2.7-linux-x64.tar.gz"
      sha256 "4140b999843e99924ccab89b5748fb635ab57d6376cca2a9c42e16f94d145de3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.7/a-team-0.2.7-linux-arm64.tar.gz"
      sha256 "1c867f8699127c9e685b1d5fb7b7defc9fc9838ce3c1d0ae656b0ef8d2a9395e"
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

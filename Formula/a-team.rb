class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.10/a-team-0.0.10-osx-arm64.tar.gz"
      sha256 "2b33e86da39511bdd042a41ad500f9aef5d26882eac4f851ff6d8b81f6709f40"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.10/a-team-0.0.10-linux-x64.tar.gz"
      sha256 "9c43622a9050c8dd37f91ad92ce445cf8f9b6e2c0d985dd295d34d77b8d20472"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.10/a-team-0.0.10-linux-arm64.tar.gz"
      sha256 "e133054793a64b9c1b1a259c545377f46b94550fd7abaa9ced9068d0cd3b0046"
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

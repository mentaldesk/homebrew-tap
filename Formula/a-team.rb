class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.87/a-team-0.1.87-osx-arm64.tar.gz"
      sha256 "69dca761ef2c97abf86b88c59e77c605e6d46307c72fbf06efecb19160442c4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.87/a-team-0.1.87-linux-x64.tar.gz"
      sha256 "d471e81c866f7be9888fcef15bad24942d175148706bea736cba228b9b153869"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.87/a-team-0.1.87-linux-arm64.tar.gz"
      sha256 "d56e0b10b887c373f6b8ea64cc36cb60699bfb168b8b450d7c70aa5de5b73ec6"
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

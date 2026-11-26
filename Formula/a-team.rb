class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.32/a-team-0.3.32-osx-arm64.tar.gz"
      sha256 "1d08f2ee5b1736c87daeb549dcb6a60718c642767a10484a1fb6ffed0fcf9db9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.32/a-team-0.3.32-linux-x64.tar.gz"
      sha256 "920bb4d222bd2f13aedc3678dd5e964991acc33d1b360846c99ddf24710428de"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.32/a-team-0.3.32-linux-arm64.tar.gz"
      sha256 "52f245ab5fb9f113452131b755b936ec2cdab008492de9cccc343b4c8deabd07"
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

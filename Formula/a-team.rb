class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.47/a-team-0.1.47-osx-arm64.tar.gz"
      sha256 "4e3e3b42818088a608a1b5933b2ca8f60e3526e2fa81f9873e4dde370a825d9e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.47/a-team-0.1.47-linux-x64.tar.gz"
      sha256 "54d31c8dc97821ca8252c19356dbc45d687b3e65bcdcb4bbfc488aa8cc3dce9f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.47/a-team-0.1.47-linux-arm64.tar.gz"
      sha256 "48278d8066b468dd8e51b471f32a1a24e6f3b81e5c7ce55ac7dfbf3ae90db646"
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

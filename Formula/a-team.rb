class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.78/a-team-0.1.78-osx-arm64.tar.gz"
      sha256 "807a43e6b7044266416b75995e8f41e21d33131390caede335fe59bf6b9b2f76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.78/a-team-0.1.78-linux-x64.tar.gz"
      sha256 "efecd50a5402591f4263b2e8f98da9ca07d3b32c2acdc458e27755b1d4660c09"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.78/a-team-0.1.78-linux-arm64.tar.gz"
      sha256 "dcdc2e15785c86d7ef4752a0126efe67b7028592d0865711859fbcc2604b8189"
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

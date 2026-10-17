class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.81/a-team-0.1.81-osx-arm64.tar.gz"
      sha256 "387fbb3d3fba24a8cb4cb7531a1eb154715685cb75095f5931517194618be432"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.81/a-team-0.1.81-linux-x64.tar.gz"
      sha256 "6a99b6f81ea96b257ccdd1a81907e7f252de0bfbfa27ce75071a04a0884a14fc"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.81/a-team-0.1.81-linux-arm64.tar.gz"
      sha256 "16206c3d486a66295856e7dcb0162f9cf68d69842fca47cb1b67ddc5edd9e7e1"
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

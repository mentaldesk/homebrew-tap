class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.85/a-team-0.1.85-osx-arm64.tar.gz"
      sha256 "689b78539b8de764584f741602c851aac150a85b65929b4bbf7552a4071d65c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.85/a-team-0.1.85-linux-x64.tar.gz"
      sha256 "3fd2baccc5a03d5ab89044dd5f048b88c50e7086a690094c177911be00092479"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.85/a-team-0.1.85-linux-arm64.tar.gz"
      sha256 "6b9eb484b9c4a103b1eb18b673bdba430a49769221fa5958eed55a63e2f610aa"
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

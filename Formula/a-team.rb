class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.74/a-team-0.1.74-osx-arm64.tar.gz"
      sha256 "3938ffbc1b121dbeefd91b1dc5720e495e91d3ef2570880a05163e6bd559433f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.74/a-team-0.1.74-linux-x64.tar.gz"
      sha256 "88cb33689bbd0a83808e51ff875828b4b4681d3de99ec07555291f357e025b52"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.74/a-team-0.1.74-linux-arm64.tar.gz"
      sha256 "9f9e1499b32c3453a0a40f707ac733a1f0e5a13ccaf65bd1bb2b271906b09357"
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

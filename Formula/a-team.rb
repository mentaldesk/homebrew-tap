class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.14/a-team-0.2.14-osx-arm64.tar.gz"
      sha256 "e796e8800a5f6b4810826419753509a6a8975320b5d25675de12372eb576ff90"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.14/a-team-0.2.14-linux-x64.tar.gz"
      sha256 "144ba0ac9617bf8e1492bfbff9a14babaa5136608f77252d3273c55f0ae1c1f2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.14/a-team-0.2.14-linux-arm64.tar.gz"
      sha256 "901dc1f381abbe98f9f94dfdfda940021dd82cf3337f808abb2dfc2ddb8c8775"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.3/a-team-0.2.3-osx-arm64.tar.gz"
      sha256 "11c13005e2ecaec480fda5f471d4880333c988dd90d855c690801b5e4065467a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.3/a-team-0.2.3-linux-x64.tar.gz"
      sha256 "c5e280a664e7b3194b752180b23a627c7ed8163f4c3c6296a990f16afda221a6"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.3/a-team-0.2.3-linux-arm64.tar.gz"
      sha256 "7182156048b745718033629c928f225acc39fd7483514060bd4f2420f084d2e2"
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

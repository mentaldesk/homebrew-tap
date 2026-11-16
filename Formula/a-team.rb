class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.12/a-team-0.3.12-osx-arm64.tar.gz"
      sha256 "de7bd3833b3af7c464642451320ea49182d67827607e5a5ef142feb2515c4b8c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.12/a-team-0.3.12-linux-x64.tar.gz"
      sha256 "46a7205b31575231de4143b9b6026b249cf3db9552740f7bf269c739dd31229f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.12/a-team-0.3.12-linux-arm64.tar.gz"
      sha256 "8fc176e9ddf36ffdeb476895ee9923f965062c35c552e026578a88b35ce5dc11"
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

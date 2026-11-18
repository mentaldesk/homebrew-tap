class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.24/a-team-0.3.24-osx-arm64.tar.gz"
      sha256 "1a7b73e29a6b24190b421f817f7ebdfdae55b21a1411ed074f248b5cc154a03f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.24/a-team-0.3.24-linux-x64.tar.gz"
      sha256 "01d5769fcec6e44dce4fa8e49c8c9501f486dddd3a53077c0da1806f41f68458"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.24/a-team-0.3.24-linux-arm64.tar.gz"
      sha256 "d4f884746808deb4a486bd0011aec5f062c256b8cf2968cfdba1af60525c7c21"
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

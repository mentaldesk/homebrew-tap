class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.22/a-team-0.1.22-osx-arm64.tar.gz"
      sha256 "bd20f1c692a72af6e0c8fe7f15eccd4de51f4bc3e03d14dcc54ed9327ddbd887"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.22/a-team-0.1.22-linux-x64.tar.gz"
      sha256 "a6f33936169234a4f9425f497ed207163e9e9b59d9b0fe9ad779c96ce33ed0d4"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.22/a-team-0.1.22-linux-arm64.tar.gz"
      sha256 "47ee3d97b6cae7fe9f6bd0f84b8c7396c7e88be2d3e87f9265896d9c94d68984"
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

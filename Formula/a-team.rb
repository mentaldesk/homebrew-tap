class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.69/a-team-0.1.69-osx-arm64.tar.gz"
      sha256 "e8eae2fb76cd1b0194f648e08871eff0a9ac39e3d8f2c7064c92003a71253c30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.69/a-team-0.1.69-linux-x64.tar.gz"
      sha256 "2e16ac891fcfc302149da8139605c3d8fa8769ca24ad0781ed8a290bb7364506"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.69/a-team-0.1.69-linux-arm64.tar.gz"
      sha256 "67bb29c185b4a14ce8d5c64839db172cb3cd0c71d1d2461d8e7fba3f2220770b"
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

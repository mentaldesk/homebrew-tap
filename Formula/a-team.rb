class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.77/a-team-0.1.77-osx-arm64.tar.gz"
      sha256 "40ec7bdf509bb890ee54a4539776a99361d9d3b6f769027ad7825c1c61f3a74b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.77/a-team-0.1.77-linux-x64.tar.gz"
      sha256 "0f7614adf197266074d162177cc486bd90c2a9d689d81a3a5330e3938a42447c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.77/a-team-0.1.77-linux-arm64.tar.gz"
      sha256 "ad913b513176ca72dd29a3b229ad04d5576c75f4a73ef6172b4c75099ed499cb"
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

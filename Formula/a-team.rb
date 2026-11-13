class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.3/a-team-0.3.3-osx-arm64.tar.gz"
      sha256 "9a958319b8e166135b75509da9528a12b507c33f301d516639a26b67295ead11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.3/a-team-0.3.3-linux-x64.tar.gz"
      sha256 "dbfc8a6b5636fa401f75e2e9c8ba456a0654656ebe542f5583bca425baf7448b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.3/a-team-0.3.3-linux-arm64.tar.gz"
      sha256 "128f52b077e1c5391009b09324425a1146900d59ce9ad48f679a128a97a5b7bc"
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

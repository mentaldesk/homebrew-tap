class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.38/a-team-0.1.38-osx-arm64.tar.gz"
      sha256 "c3d4b1cea534c5c691fc7e0411af7ff708f81f61db0394dc33576cd86b56b853"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.38/a-team-0.1.38-linux-x64.tar.gz"
      sha256 "93467343b444ca8b5e57cd9b96d5b26576cf789a4b7117c4e04dc0762a03df75"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.38/a-team-0.1.38-linux-arm64.tar.gz"
      sha256 "59c7d46cb6a62506eb4c4ea948fbe60bc53bd44f8cf7278b177734aa1a4519e8"
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

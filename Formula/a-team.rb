class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.68/a-team-0.1.68-osx-arm64.tar.gz"
      sha256 "1e2353972761247acba790b85e26d2fcc4722cedc1b166339151b406999ce29a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.68/a-team-0.1.68-linux-x64.tar.gz"
      sha256 "c9e505209949b48905800d02607a3174ab44ca03b87c679d0db4555a2d885e3d"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.68/a-team-0.1.68-linux-arm64.tar.gz"
      sha256 "9f7d71339c74e46b30aaad00c7f2fbba032f763fabd23bc97ed0bd7317b94382"
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

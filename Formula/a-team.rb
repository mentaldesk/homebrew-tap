class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.34/a-team-0.2.34-osx-arm64.tar.gz"
      sha256 "f94312773d4127be961dd3df3581b9a10e8377931e8bb74cc7f9c15886ecf21e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.34/a-team-0.2.34-linux-x64.tar.gz"
      sha256 "83d68ec94e17dba48e6279977f4d53cd3d0d41eac0137b94853cc28da48caf40"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.34/a-team-0.2.34-linux-arm64.tar.gz"
      sha256 "f3cd657ce562c591d118a3efa565d343fe38390d33234fc945317bbc1753bcb7"
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

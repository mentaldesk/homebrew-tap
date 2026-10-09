class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.40/a-team-0.1.40-osx-arm64.tar.gz"
      sha256 "2bcf61f532b13eb2f17b10ebaa4715c3e7674c647e0e48fbbd858c179528b832"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.40/a-team-0.1.40-linux-x64.tar.gz"
      sha256 "b04d705a8dfaf4e9af722c763fbc859bdf8bd62a18fac697ee4907b678afe4b7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.40/a-team-0.1.40-linux-arm64.tar.gz"
      sha256 "d3130f1c921ae1e740e1097a6c63b47a2d1d4d9ea46291a29635c7cae23bb59f"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.86/a-team-0.1.86-osx-arm64.tar.gz"
      sha256 "eae314b278be22b3e3a0f7f917420bbabcc5f8293730780f3800a8fc3e51caf2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.86/a-team-0.1.86-linux-x64.tar.gz"
      sha256 "ed358d6c135c4ca9dea4253690db14f4d41ea937fd24cc405b5cd8c05a881374"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.86/a-team-0.1.86-linux-arm64.tar.gz"
      sha256 "3654401de6872adb28412cbdf1015be55f580f2fd9c95f4d1d532179a4e766d7"
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

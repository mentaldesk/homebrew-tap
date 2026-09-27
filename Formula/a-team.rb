class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.1/a-team-0.1.1-osx-arm64.tar.gz"
      sha256 "b0ba039e87053e52c0d77dd2e8e0f7d1994b369be4350a59bb65c33918831ee2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.1/a-team-0.1.1-linux-x64.tar.gz"
      sha256 "56260f2ac662aae3f46a75929cb36e021de1ea96d35adc430caf9b1268866c6f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.1/a-team-0.1.1-linux-arm64.tar.gz"
      sha256 "67d4d04995de206e3395ebdbfa17999144df16d3ee37ceb009553030cafcd20e"
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

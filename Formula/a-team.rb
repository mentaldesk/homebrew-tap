class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.70/a-team-0.1.70-osx-arm64.tar.gz"
      sha256 "85f0fb7ba7a52eb38109b5f67a0e03dd02d802bac2bc932d57ff3d0720c77fa9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.70/a-team-0.1.70-linux-x64.tar.gz"
      sha256 "a59141095dc1f2ec817484b4995dcf599a5fdde50e7c1641aa3bf9a32e81cad7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.70/a-team-0.1.70-linux-arm64.tar.gz"
      sha256 "4ecf199585ebf2981e34d5084008ba3c50f79037e53cf17a90c18443a4e29717"
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

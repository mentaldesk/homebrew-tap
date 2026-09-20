class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.4/a-team-0.0.4-osx-arm64.tar.gz"
      sha256 "6a78dca81f785645d925a27a45b0a5d6d820b3eaf1281ddcd10e1e6f7eaa1db1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.4/a-team-0.0.4-linux-x64.tar.gz"
      sha256 "8cae8d6f565f5937129526a2c4393ff934bc2c52ce699d3d6beed11332e38e52"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.4/a-team-0.0.4-linux-arm64.tar.gz"
      sha256 "4a8c8c93c0d0220e0751c18de1f3de8f30864614fb36596c81ab7ff101ba77c2"
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

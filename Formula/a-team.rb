class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.35/a-team-0.1.35-osx-arm64.tar.gz"
      sha256 "49d29ad1f3e5b531273d0259e3987cfbfac5a86f1d3b1e3201a9b3aebde45edd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.35/a-team-0.1.35-linux-x64.tar.gz"
      sha256 "ec2f8784b981fa50f479a963de2775071c205f90ebe7076ba575a296c025681b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.35/a-team-0.1.35-linux-arm64.tar.gz"
      sha256 "1ad20545f585857afd01bc4efe06b00c5c273eae15b9f3abc59816b6953623c4"
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

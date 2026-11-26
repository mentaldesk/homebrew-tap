class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.33/a-team-0.3.33-osx-arm64.tar.gz"
      sha256 "6d1e12eb0fd53562ef1a23362c33bb3064d796322bac5755901e34353a9cec27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.33/a-team-0.3.33-linux-x64.tar.gz"
      sha256 "0bd41f885b3b28350bd99fb073b9af7bf96e8bd0996668722020fed399af2bf9"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.33/a-team-0.3.33-linux-arm64.tar.gz"
      sha256 "fe2dec948ee16622aed7a8a9a98aa3ef4c25fc63c660d1608c27dc7b0651956b"
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

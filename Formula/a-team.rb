class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.6/a-team-0.1.6-osx-arm64.tar.gz"
      sha256 "044ce7fd096a7828980953bf59fd9d3a479f7c3fea6ded2a9ccbaa37d64cf255"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.6/a-team-0.1.6-linux-x64.tar.gz"
      sha256 "a7ad4e970ba67ab232584e06e2237a4f3455a2959269e2ee8986d9fa1acb345a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.6/a-team-0.1.6-linux-arm64.tar.gz"
      sha256 "8d22efd594e989b47296bb718ca9bf707df2d2315d99272fa02afe2c428cb860"
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

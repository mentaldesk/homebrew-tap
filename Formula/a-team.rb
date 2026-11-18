class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.23/a-team-0.3.23-osx-arm64.tar.gz"
      sha256 "a48ba69b0c6a0a2a1ab6c93d756b0762372280a23caf0aa857bc5f2993559e8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.23/a-team-0.3.23-linux-x64.tar.gz"
      sha256 "29c24b4b6f1b136d1418921e108f521e310b91f1f95205830cee84fec139b7d8"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.23/a-team-0.3.23-linux-arm64.tar.gz"
      sha256 "efce305deaee5fda6bff30becdfc675f0ee37e54e5665a07978ec183527c99bc"
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

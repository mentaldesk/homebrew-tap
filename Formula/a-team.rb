class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.58/a-team-0.2.58-osx-arm64.tar.gz"
      sha256 "eba889ffd49292347a20a2c901afa73a6d50a03000fdc65f22f97a7908f4733c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.58/a-team-0.2.58-linux-x64.tar.gz"
      sha256 "601b37e5f70a300671a2fc2d59bcd93687a825d021f6a148d9a4502586d18312"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.58/a-team-0.2.58-linux-arm64.tar.gz"
      sha256 "5c757bf0cd42d84852f57c7660cfb1fc09604cac58c419b60f08a177a26e1523"
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

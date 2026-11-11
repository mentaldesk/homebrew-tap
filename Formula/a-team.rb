class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.0/a-team-0.3.0-osx-arm64.tar.gz"
      sha256 "7f64f9e18b5d5b60124aa0279d52b29bd74e613df779309eb654c0ca8c1c8277"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.0/a-team-0.3.0-linux-x64.tar.gz"
      sha256 "2733c7e8d8e3bcdb8d54914a74ac508e5e1d6cb6b9843fe08db68d0ac348c1bf"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.0/a-team-0.3.0-linux-arm64.tar.gz"
      sha256 "e82fe273742fbf18e890f311dfbc2aa009fe668a95308d602d7d8549744ed30b"
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

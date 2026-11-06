class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.31/a-team-0.2.31-osx-arm64.tar.gz"
      sha256 "fbf3626b53a05605dfd84de7dbab8d24ae71972face80e566e9d52f3877912af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.31/a-team-0.2.31-linux-x64.tar.gz"
      sha256 "d273a8f507b7a0c3821a90153827f80d135ac49c31e7e02c3d84fd4a8f65a906"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.31/a-team-0.2.31-linux-arm64.tar.gz"
      sha256 "84394988078202c1cb9e3349255c7eb2bb16c948af6bcd9280cc1332516f7091"
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

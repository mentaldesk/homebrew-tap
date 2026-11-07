class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.41/a-team-0.2.41-osx-arm64.tar.gz"
      sha256 "a2994042414bb01642e3ffdae1d5348c1875ffcd2a3e22da1b456dd2d5ac1102"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.41/a-team-0.2.41-linux-x64.tar.gz"
      sha256 "2c1dce4f2cb340b76a5ad902a61c7d2da6e5ae2abe6445ee609d2ad4b0707639"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.41/a-team-0.2.41-linux-arm64.tar.gz"
      sha256 "d19c48fa085e77300039ebcc2f420b40c843fb75747a9ed39388c1e6fd65bbca"
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

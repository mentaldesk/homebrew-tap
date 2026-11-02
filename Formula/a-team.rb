class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.16/a-team-0.2.16-osx-arm64.tar.gz"
      sha256 "4a4590c0a0d99c77352e9e84a6415299a3e78e8d366b9bfe0998ecd52e5aba7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.16/a-team-0.2.16-linux-x64.tar.gz"
      sha256 "7557ce074f4dd80d3b1182411b1f8d72e284eee28848f5ca184e9c4291448214"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.16/a-team-0.2.16-linux-arm64.tar.gz"
      sha256 "6e200c097761e6da4c8b92f70e931ceb496065ea380b170f3d3659d76798e208"
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

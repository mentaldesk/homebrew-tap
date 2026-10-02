class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.8/a-team-0.1.8-osx-arm64.tar.gz"
      sha256 "497f43d9d4be425fb9d9a9c33fc500ebb8f8fc067d811f17fef6927989d5d9c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.8/a-team-0.1.8-linux-x64.tar.gz"
      sha256 "b4369d2a133cf4ce2b8b08460227f3d5dc72018c4225ed7f0046f9433d4926b2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.8/a-team-0.1.8-linux-arm64.tar.gz"
      sha256 "b13049666d270da9121a518fb7feb84dc725ebf49365da8715264d6ed8243168"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.62/a-team-0.1.62-osx-arm64.tar.gz"
      sha256 "032b3db3143e2a858bd81bc3e96ec53cca938916a11fd78e1ba8c71b41eb4855"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.62/a-team-0.1.62-linux-x64.tar.gz"
      sha256 "a0d592de3afe50f06e017b6c22899b79c8ba0d7f6de9ab73c03981a18517acd5"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.62/a-team-0.1.62-linux-arm64.tar.gz"
      sha256 "f1f409f3e922f97d5c1e39dc690de6d26cba8a3db5465f9ae22db628ed3d82cc"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.4/a-team-0.2.4-osx-arm64.tar.gz"
      sha256 "7fde40707ba4380ef2f3a013d3b7a52d75cdf5ddf82a783a77f12e0298c90e36"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.4/a-team-0.2.4-linux-x64.tar.gz"
      sha256 "fb37ea805651023de8a36bca8a1129e60d5ec2309b6566ed7e752aad0274a9a8"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.4/a-team-0.2.4-linux-arm64.tar.gz"
      sha256 "2bef9157f0416fa5812368b4eebf578a027a8f7816f28257a445a216a3874ff5"
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

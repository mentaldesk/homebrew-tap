class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.42/a-team-0.1.42-osx-arm64.tar.gz"
      sha256 "ec1bdc288010ca67f4cfae5f187167ecc5dfb1067d26fb7fc4a6f5528c900442"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.42/a-team-0.1.42-linux-x64.tar.gz"
      sha256 "cd734a049c7d5fe9e034d921f89170e1c6b247847e6b41c19de4b0e6b932062c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.42/a-team-0.1.42-linux-arm64.tar.gz"
      sha256 "b14d202d55ce8ca3f543282cf6ccca3dd22ad4b61da43bd5b9131a3a4de405bf"
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

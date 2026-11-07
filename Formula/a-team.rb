class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.42/a-team-0.2.42-osx-arm64.tar.gz"
      sha256 "c3d769138bb7cb9046e665dfea64a740a553151e0779a1836dc8187c33b615c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.42/a-team-0.2.42-linux-x64.tar.gz"
      sha256 "1604ddb474b1116577f6f9d56a66c5b75533e74f5d6309a489e6185257206d6f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.42/a-team-0.2.42-linux-arm64.tar.gz"
      sha256 "ed7c2b55ddedebe6257b0f43d934a355509bd14b746846f45138b52aa9689a13"
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

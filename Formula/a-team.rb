class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.49/a-team-0.1.49-osx-arm64.tar.gz"
      sha256 "4b71fe64e36d846edd7897c567a2541d3fa776c580e0b675780ac45e15362cd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.49/a-team-0.1.49-linux-x64.tar.gz"
      sha256 "1d6b671f220e2cd1a147f2aedaba437567951721382a451719bbb1123955b8c4"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.49/a-team-0.1.49-linux-arm64.tar.gz"
      sha256 "a479fb5add413dfa4739d7e44145a8ef296f9286600912e55ce6c14f061bc80b"
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

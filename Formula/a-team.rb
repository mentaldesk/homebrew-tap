class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.2/a-team-0.3.2-osx-arm64.tar.gz"
      sha256 "c9394379ec436d4fda736c61775f04761a5b89eb3a6e548b3ff34e31ef0f067a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.2/a-team-0.3.2-linux-x64.tar.gz"
      sha256 "3e70c917e186cda3748fcf942c009aae91cff43f28fb2665eac05dbef8ee51eb"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.2/a-team-0.3.2-linux-arm64.tar.gz"
      sha256 "23511f0a409c2067b2ff7c18e40358b89002490202e03632fa6dafc46f85c383"
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

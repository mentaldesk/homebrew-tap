class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.39/a-team-0.2.39-osx-arm64.tar.gz"
      sha256 "6eede6a225b2e9ed5f69b5b0c5547deb1a4ea5f2f66ad3c743b73b9a0ae3e0ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.39/a-team-0.2.39-linux-x64.tar.gz"
      sha256 "af1573b23f6679a4451efc55221e3675043cedbe8afcc9b61633fe3b2a54e565"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.39/a-team-0.2.39-linux-arm64.tar.gz"
      sha256 "edf389c8b8c8ddd4f2b11c8c9dca2c5e567385423863e78e1614a1afd36dc164"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.72/a-team-0.1.72-osx-arm64.tar.gz"
      sha256 "f46bfe48aeb5112e253a639142b691463e0ef83fe4c0f2b0c8145da95237a439"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.72/a-team-0.1.72-linux-x64.tar.gz"
      sha256 "5987a1883a4b965110d807096d32b07767b1a3fc2450164d89e7022c7c520ebe"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.72/a-team-0.1.72-linux-arm64.tar.gz"
      sha256 "11d9ce0d9bde443eee16cea3f9f62c282d7ab2376c87036099cc2121714833be"
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

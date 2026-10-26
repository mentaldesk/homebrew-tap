class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.102/a-team-0.1.102-osx-arm64.tar.gz"
      sha256 "f4b1c2767933769a5eb4ff9b45ed200065dd69a1dc8594db5821932f726eaa8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.102/a-team-0.1.102-linux-x64.tar.gz"
      sha256 "d7ad3df70ed7bdf255e40df9d51af4324c8350c01535a037660176233a01b4ff"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.102/a-team-0.1.102-linux-arm64.tar.gz"
      sha256 "78da43c4404adfa3af0ed2e374b7cb0ea46e559b6f113512eabb795e35784ff4"
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

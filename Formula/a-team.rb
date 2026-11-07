class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.48/a-team-0.2.48-osx-arm64.tar.gz"
      sha256 "98e64226025bad1965fc80cb750c5bd1e9f8243afff83fd5259a9d5050a80eb7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.48/a-team-0.2.48-linux-x64.tar.gz"
      sha256 "9a3636c4600c05d716cbfa746e8b72dd83de63cbb7c308550f85d5bf6d3ab840"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.48/a-team-0.2.48-linux-arm64.tar.gz"
      sha256 "df46ed38ba46962a480e09d4d4ba22d8a045fc6ec026a8258a23f0ed9e825df2"
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

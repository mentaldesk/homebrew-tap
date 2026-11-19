class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.26/a-team-0.3.26-osx-arm64.tar.gz"
      sha256 "73cc9dd87e98cf4131c2e54e3c4725a7a370254ae8b9f608a1c7a94d85dd6f90"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.26/a-team-0.3.26-linux-x64.tar.gz"
      sha256 "5c11bd1dd395fb77aa069c33a37da734ac191faa1522a962d39f5ced42e58c29"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.26/a-team-0.3.26-linux-arm64.tar.gz"
      sha256 "46ab0f4c1d2c3b734648a3af962bfbad12a2bfd32f29af6c64846709350830dc"
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

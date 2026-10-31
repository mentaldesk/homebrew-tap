class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.8/a-team-0.2.8-osx-arm64.tar.gz"
      sha256 "5891e4be4c615292143d67ff3662cbf33b47986696736d4581c8d546a3eda0c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.8/a-team-0.2.8-linux-x64.tar.gz"
      sha256 "45f54e4bc6928a4b021b0c3623d2e5fbd76c8d6864a20c6d50c5c35372115a52"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.8/a-team-0.2.8-linux-arm64.tar.gz"
      sha256 "6470bbc4854d9d9a962e0889dad6859fcae1b8a9999cc5c08be999f00cca1270"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.32/a-team-0.1.32-osx-arm64.tar.gz"
      sha256 "749eae40b4655dfaa13e2bb1fc72955fed5a048c145e1f4c4204258cbc161c88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.32/a-team-0.1.32-linux-x64.tar.gz"
      sha256 "8bde1b86ddb727576cef2d3dacc816ba704cb209f9c5510d86f17e467bc6058a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.32/a-team-0.1.32-linux-arm64.tar.gz"
      sha256 "d987fe8f807e15ef89ec1babf800d91287e454a087c6544cbf400db6e6ead64b"
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

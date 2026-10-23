class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.94/a-team-0.1.94-osx-arm64.tar.gz"
      sha256 "c981066dd008455a36f02897c60a34dd53fc2f717749b64fd92ac7101f26e89d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.94/a-team-0.1.94-linux-x64.tar.gz"
      sha256 "a0f733df29cfb265cade09f1350d14862d48dcd1d1f015b26bacfab170a06b92"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.94/a-team-0.1.94-linux-arm64.tar.gz"
      sha256 "b5411b547d27e03cd58b22ef72d95f5d1e5782cb95de1f544b1386bc44217b31"
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

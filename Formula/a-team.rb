class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.26/a-team-0.1.26-osx-arm64.tar.gz"
      sha256 "0e87620a53d9f92250cef97632c0ed929b168adac745d49dc0bdf24f7674be1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.26/a-team-0.1.26-linux-x64.tar.gz"
      sha256 "89adc70ecc77dc373a8b09623e907c27e6c45c38b39b856d04839f4554bbd565"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.26/a-team-0.1.26-linux-arm64.tar.gz"
      sha256 "50cce4167ea1b3994ad90e571012ba52426539e3841e8105de94e259762d3c65"
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

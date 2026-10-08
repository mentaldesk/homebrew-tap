class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.28/a-team-0.1.28-osx-arm64.tar.gz"
      sha256 "84a8167d5152704da9585a73cee9353c41f0a4ab67e63669d3a051192e861f98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.28/a-team-0.1.28-linux-x64.tar.gz"
      sha256 "d1ac79a4ad0f2802bb4d212d1267db13630f4290bd0c355a2fa38b2305dade02"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.28/a-team-0.1.28-linux-arm64.tar.gz"
      sha256 "72ff9c883e9ad4a531ade6170e95d82b68d11c563367032d6ea4b4fa75860bd0"
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

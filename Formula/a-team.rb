class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.45/a-team-0.1.45-osx-arm64.tar.gz"
      sha256 "82c19c77dd4602ac533656ac4439abef9a2db94fdc06b332b93db040120174df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.45/a-team-0.1.45-linux-x64.tar.gz"
      sha256 "2953841d3478bd1bc2e44411a7040a4d2de28239334c70f92da718a58077b173"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.45/a-team-0.1.45-linux-arm64.tar.gz"
      sha256 "97c2cd2265c058317952da2bd1c393a94c7688dba83db346b08f45a4cbef505a"
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

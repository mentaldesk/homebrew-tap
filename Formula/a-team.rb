class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.44/a-team-0.1.44-osx-arm64.tar.gz"
      sha256 "55c1ed6289755eed87cdee4c7d1cf11d07dc0e0a2c52d51f95e233b801540a3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.44/a-team-0.1.44-linux-x64.tar.gz"
      sha256 "f5ba50481e7569efbe5f90bddcc9105dfb3ade8c0404fa28c6edafb53be3edc7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.44/a-team-0.1.44-linux-arm64.tar.gz"
      sha256 "eb164f74736f7fe0748b107a754aaa34ba14ac682c191ccf1d011a74463a7544"
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

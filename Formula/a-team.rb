class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.58/a-team-0.1.58-osx-arm64.tar.gz"
      sha256 "ffc7e7347a5e834c7106d8549a8eb319e4b5beeb350dfdee518849a452c063e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.58/a-team-0.1.58-linux-x64.tar.gz"
      sha256 "2ef59ebdd8206cfc69e65b442f2b5d5cfe36db4b9dbed20ea5fa3cc227ef6d1a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.58/a-team-0.1.58-linux-arm64.tar.gz"
      sha256 "479c150138ca72f2c44b8826241a81d15e6827594dbdbce474a67611cf570da0"
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

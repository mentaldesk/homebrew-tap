class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.9/a-team-0.1.9-osx-arm64.tar.gz"
      sha256 "8a0d972a1e8117666e22b36588a7fc6dadd78e9719a6f79ac102a00a5c606535"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.9/a-team-0.1.9-linux-x64.tar.gz"
      sha256 "8d3eac9112ba6a62dad991578c282f082c55ae2b039ad2df1e79a635600e991c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.9/a-team-0.1.9-linux-arm64.tar.gz"
      sha256 "bfdc346946c864c6cd3992e8cf5c73397bd0f7e654af15197634cb78f0d103f0"
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

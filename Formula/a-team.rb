class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.88/a-team-0.1.88-osx-arm64.tar.gz"
      sha256 "943fda518c52ff454b1d77e1afe0436809a96de6ccab4ba477c820f95832e668"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.88/a-team-0.1.88-linux-x64.tar.gz"
      sha256 "741f7dd991f00b44a4d46ccf7bac0da7b3cb4577f0bb5a7d64b205bbb1fc7eae"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.88/a-team-0.1.88-linux-arm64.tar.gz"
      sha256 "c27be041053093a1194d91ef7c1cc6c87fa82e043500f8c1f658945c4ff43a68"
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

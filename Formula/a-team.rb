class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.57/a-team-0.2.57-osx-arm64.tar.gz"
      sha256 "a2536e76509d114ceabd4351b48dd4936f2ab7e22d9b480c38ed4516764b167f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.57/a-team-0.2.57-linux-x64.tar.gz"
      sha256 "2e0c54fe401fb11daddab8759e4f8e5e7d514cbd5128c01e72b51f5171f9cad6"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.57/a-team-0.2.57-linux-arm64.tar.gz"
      sha256 "bb764a40ec069557e90dd20a8507acc26241fcdda7e6c33bfd09c7c8b34a6748"
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

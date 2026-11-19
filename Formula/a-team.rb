class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.25/a-team-0.3.25-osx-arm64.tar.gz"
      sha256 "c18b1322c7bf2a4fbb410aa1049cd2dc335ca88f6fd91799bb1f0ccc019f211e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.25/a-team-0.3.25-linux-x64.tar.gz"
      sha256 "4b449c49fe7dc40798ad11bb313127293a424bb71bd252698acb44de6f8443b7"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.25/a-team-0.3.25-linux-arm64.tar.gz"
      sha256 "110995010dd4c660624a14c047a81d2c6f430800a689200333fd3f27896ab110"
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

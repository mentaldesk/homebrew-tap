class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.36/a-team-0.2.36-osx-arm64.tar.gz"
      sha256 "788d207e4f4c527e531a713c2ec0b45168859050d18bf0ede152ff51006f2501"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.36/a-team-0.2.36-linux-x64.tar.gz"
      sha256 "8beeb9dd80a76f8a750a5cffcdc2fd08ab28075c6592ab4b5318b580370cf0d1"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.36/a-team-0.2.36-linux-arm64.tar.gz"
      sha256 "5de485f805efb533ea2bbf9968dd6b99c88fe7fa5e5711416b223582c0ce532e"
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

class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.93/a-team-0.1.93-osx-arm64.tar.gz"
      sha256 "238bf61abd7bc33527e763ea8c279117f7a025958b3cfd710518feaac510ee33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.93/a-team-0.1.93-linux-x64.tar.gz"
      sha256 "b92db29cb6c40e8848f90030a1194db4161e9639e352ba6f4f802bd095507cf3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.93/a-team-0.1.93-linux-arm64.tar.gz"
      sha256 "3a7cc4e89782a67b17baf7b6bcf816ebd635f673f457acde217109f96649bc3a"
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

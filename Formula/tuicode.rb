class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.8/tuicode-0.9.8-osx-arm64.tar.gz"
      sha256 "734869f73e58134a74510d0530ff333998d0832bcc97751ff1c3d25efe994682"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.8/tuicode-0.9.8-linux-x64.tar.gz"
      sha256 "80c10a025fee362aaf4a73630960251a487c23b78f7c23a7444fd8232eb12899"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.8/tuicode-0.9.8-linux-arm64.tar.gz"
      sha256 "d98129838fc87623b29d2ef08678b0ac0303aaed76062ca802f7e7adaa28517d"
    end
  end

  def install
    bin.install "TuiCode" => "tuicode"
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      To enable native macOS shortcuts in iTerm2 (Cmd+C/V/X/Z/A, Cmd+arrows,
      Shift+Cmd+arrows), run:

        tuicode --install-terminal-integration

      Or open Settings (Ctrl+,) → Terminal Integration from inside the editor.
      Other terminals will be added as they're supported — see:
        https://github.com/mentaldesk/TuiCode/issues/40
    EOS
  end

  test do
    assert_predicate bin/"tuicode", :executable?
  end
end

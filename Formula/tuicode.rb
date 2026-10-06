class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.10/tuicode-0.0.10-osx-arm64.tar.gz"
      sha256 "8ee06df445b8a398d0ff3210113fc9fd71b4e661483b1559859fbfcd0628fd9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.10/tuicode-0.0.10-linux-x64.tar.gz"
      sha256 "41611c61b2f12130158737cd777c1a2babcb274c6e7b50cbb50407ca61240483"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.10/tuicode-0.0.10-linux-arm64.tar.gz"
      sha256 "bbdb212ce9888a78e089cc70c11f08b38b5d40218c63b209ac5e1d6cc79dbc9b"
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

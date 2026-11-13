class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.18/tuicode-0.9.18-osx-arm64.tar.gz"
      sha256 "0d158e332097b6b8fcafbd06dcf34bfb5b05c8c817171c443284d67f837ffb57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.18/tuicode-0.9.18-linux-x64.tar.gz"
      sha256 "4124b9fb65edec1f220018e400490254d001b4ae2cae30097bddfb4ad3d540ba"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.18/tuicode-0.9.18-linux-arm64.tar.gz"
      sha256 "2b8ea439f009033334d0f3162635860032e5ac0abd4a0ba3eb985577c8b76e7b"
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

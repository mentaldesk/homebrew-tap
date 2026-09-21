class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.5/tuicode-0.0.5-osx-arm64.tar.gz"
      sha256 "1476be749062acc25f6b3c70ba37e83013003a857b1c24e774562f876cb513c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.5/tuicode-0.0.5-linux-x64.tar.gz"
      sha256 "1141002b38bce0c75f44cf949e1fa9f7c5424e7cafd3b843e49183098e9b00ee"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.5/tuicode-0.0.5-linux-arm64.tar.gz"
      sha256 "d2ab36547026dd736d7b68252145097a322bd346280c373422eff574052bc745"
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

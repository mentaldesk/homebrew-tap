class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.16/tuicode-0.0.16-osx-arm64.tar.gz"
      sha256 "a4640e20aeda2ea873a0050617c53759347f5c21df4b72d6f0514653f2ca9d8b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.16/tuicode-0.0.16-linux-x64.tar.gz"
      sha256 "15d7125dec88a042c176f0fcff728f53b3c49be8eeb8997674fd26c2f53c89d4"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.16/tuicode-0.0.16-linux-arm64.tar.gz"
      sha256 "82ef017f6f4ea7ca68ea8d45da11a7682071d5c792d4db963f4c8f65a6fd1943"
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

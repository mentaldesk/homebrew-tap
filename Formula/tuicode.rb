class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.22/tuicode-0.9.22-osx-arm64.tar.gz"
      sha256 "3f5de5235b7a750ecfa842d623263197f63ef2e8640ac1961200b8b3b7fe7564"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.22/tuicode-0.9.22-linux-x64.tar.gz"
      sha256 "0cef1f9c400e1df675006ce1a38ebca3ed5aa36acc869a6d33f07d90c63a96b7"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.22/tuicode-0.9.22-linux-arm64.tar.gz"
      sha256 "2a0ef162c06c6a5056a38a32ad654ec22357d7327eb81042a7c13cdc61e6b4fe"
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

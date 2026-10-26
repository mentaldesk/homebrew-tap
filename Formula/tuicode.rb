class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.0/tuicode-0.9.0-osx-arm64.tar.gz"
      sha256 "a53b23d3a1c834ff4e517043594f790b2e00843dae592d140d065f6ffdf959c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.0/tuicode-0.9.0-linux-x64.tar.gz"
      sha256 "f406383adc4374b328996bfd4ee47f9a46c3506bf7c02c3c2f9c054b5850d7e2"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.0/tuicode-0.9.0-linux-arm64.tar.gz"
      sha256 "1b5832b804db7ef8c88c9f866c706d60f48a97771408eb1178d90e3cf79cf35d"
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

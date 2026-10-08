class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.11/tuicode-0.0.11-osx-arm64.tar.gz"
      sha256 "2560991fa1e34f4253034e08ed3017d16c6634ce4d05c860095fcf6638255084"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.11/tuicode-0.0.11-linux-x64.tar.gz"
      sha256 "9f1c2f84bd042afb2cb0d80ca77f39de38b2ede7aad4a2af615ad2f6865b832b"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.11/tuicode-0.0.11-linux-arm64.tar.gz"
      sha256 "724d73858cf78acaeb8fbffb9c67b922ff9fac5718f4dd73161ec5982278cdfd"
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

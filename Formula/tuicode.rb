class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.6/tuicode-0.0.6-osx-arm64.tar.gz"
      sha256 "ad3badc9c44e82487ff5dec605c0a5beffa804b4854578c7163e96d4008106f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.6/tuicode-0.0.6-linux-x64.tar.gz"
      sha256 "bca54be554d94d2268f896b239bc63d53fb6b338986b5de0245dd87300bf5a12"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.6/tuicode-0.0.6-linux-arm64.tar.gz"
      sha256 "8b8eb41c42bd6eb5be2d10d202d5229f85419b2474eb9870fc2a51f67437731e"
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

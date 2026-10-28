class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.2/tuicode-0.9.2-osx-arm64.tar.gz"
      sha256 "7f054b860e76cae981091799ccfc5c8c5faaf4e8175b089a36558da9f2b2e0d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.2/tuicode-0.9.2-linux-x64.tar.gz"
      sha256 "a918f06d0b3b8d7dfd809183845b6462187776b8c8f1b33bc1e7528e8346b165"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.2/tuicode-0.9.2-linux-arm64.tar.gz"
      sha256 "f282ecbc1a878d0470d5ff2ccfea2396566397e03a43d8e7f94fb32084a0ab90"
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

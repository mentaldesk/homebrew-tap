class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.12/tuicode-0.9.12-osx-arm64.tar.gz"
      sha256 "bc73076ddde5955352b0c1083c714b6abf87fc5cb62683f46b518a9590068605"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.12/tuicode-0.9.12-linux-x64.tar.gz"
      sha256 "b74d3e394062404c355e4c924e2a97b0f28b03cae19204b70d11cd2044c319e0"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.12/tuicode-0.9.12-linux-arm64.tar.gz"
      sha256 "47a51a7ca16077fd48d511f1cb8d8af69df9b6b3053753513574da50b23ce2e5"
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

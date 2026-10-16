class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.21/tuicode-0.0.21-osx-arm64.tar.gz"
      sha256 "8597fa494f16d2ff0de6e71debe1ecb2b15f8cf56f96534ee5f526e7e7ff7468"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.21/tuicode-0.0.21-linux-x64.tar.gz"
      sha256 "41c8c4ca4ce5720699c554b2542b75495f87e877873f7bf4d6412712a45fed4a"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.21/tuicode-0.0.21-linux-arm64.tar.gz"
      sha256 "9fc638d146223e4d651a1fd86d2b9dee6dda9d8c7414c2155b5df591c1188118"
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

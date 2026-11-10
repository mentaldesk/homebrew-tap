class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.15/tuicode-0.9.15-osx-arm64.tar.gz"
      sha256 "6bef1d1b2e4d8354ed4114a5e5b85c12e401747614890f1415c6e31bcad674e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.15/tuicode-0.9.15-linux-x64.tar.gz"
      sha256 "766c331433603f8f8d374bd3e667e9ffd25076cd6314372486b69cd9c8f1dae0"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.15/tuicode-0.9.15-linux-arm64.tar.gz"
      sha256 "814d5c1e891c996e7b33292ead733d778b6936cf938f992b007b97b15e27fad9"
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

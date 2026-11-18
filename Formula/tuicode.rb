class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.21/tuicode-0.9.21-osx-arm64.tar.gz"
      sha256 "fd7b093fd5f81345ac80ebebb6533f3c0d08e647ad95e4089b3facf39e2ae814"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.21/tuicode-0.9.21-linux-x64.tar.gz"
      sha256 "49121ea4c1f56d12bda7e93b7047b169f110475cf840555617fd3dc4e0cfd183"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.21/tuicode-0.9.21-linux-arm64.tar.gz"
      sha256 "8dbc3527ee4ce917cbf8ab8b1d692d58e2c9b3b32e7a1b54a5c8a03895bb0b6e"
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

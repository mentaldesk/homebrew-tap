class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.13/tuicode-0.9.13-osx-arm64.tar.gz"
      sha256 "445b4d76b3da00dcb7aade618f12ef47c48c6cdd4f4af5eefbb56ffaa2d71390"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.13/tuicode-0.9.13-linux-x64.tar.gz"
      sha256 "ec606751253416524d119e9e24ee7dbaa52d4b2bd4457e4b9ec64c786778ffa2"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.13/tuicode-0.9.13-linux-arm64.tar.gz"
      sha256 "659c6fa5651021b557f0ad2dd51efb51e346eb34bc62fdbc1e9258dac0b605fb"
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

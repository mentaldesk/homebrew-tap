class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.14/tuicode-0.9.14-osx-arm64.tar.gz"
      sha256 "a3cc5d42b9d35a6a368a8c253d376385c5197062283703f17ceb76c806ad36b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.14/tuicode-0.9.14-linux-x64.tar.gz"
      sha256 "ea30e37e839610b99d4a43f8d21ba1013beca0e121d2131419792e70f7dd2116"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.14/tuicode-0.9.14-linux-arm64.tar.gz"
      sha256 "ada9778c5d268b06594ba8c06e2979adee2d83078312ad5ed7c0dbb9bbd263f5"
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

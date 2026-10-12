class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.17/tuicode-0.0.17-osx-arm64.tar.gz"
      sha256 "9664db4394b605c275d103640521c7634cd1327a609fcfad0cd587848f734a08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.17/tuicode-0.0.17-linux-x64.tar.gz"
      sha256 "524abdb404f168903b38ad6c7287700b12db78f5f72808261dfd1672f8caa254"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.17/tuicode-0.0.17-linux-arm64.tar.gz"
      sha256 "7834b370740de12f5a69a6f313710009181d5813e90d93bbb51ac5cb8a05703e"
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

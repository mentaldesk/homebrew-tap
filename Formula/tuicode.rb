class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.12/tuicode-0.0.12-osx-arm64.tar.gz"
      sha256 "c802f5f53e8238bcd4e423673285cee555e099463e75f122b025979e7f4ba89a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.12/tuicode-0.0.12-linux-x64.tar.gz"
      sha256 "d65ddccc025ae0c3e4c840169f98cca0283d3d13e01f2834c96809e8f43068dc"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.12/tuicode-0.0.12-linux-arm64.tar.gz"
      sha256 "d3a0d804a902ef15094f313d8100cedc2fa3ecebc93098fdcb6033d18e2d6937"
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

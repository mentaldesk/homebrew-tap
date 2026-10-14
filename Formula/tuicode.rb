class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.19/tuicode-0.0.19-osx-arm64.tar.gz"
      sha256 "2438b7025e159e429b8e04810959d2bce6a3855aa6a660f5d590263afd92c3e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.19/tuicode-0.0.19-linux-x64.tar.gz"
      sha256 "f8bd568cf222c2d242b692435650fe7db59573a7860eb4b23e5bd1232179da9c"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.19/tuicode-0.0.19-linux-arm64.tar.gz"
      sha256 "d25286ac27a7476a38ae493daf37a67ed16b1ed5ee29686ac9655b6d7d2cb4fd"
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

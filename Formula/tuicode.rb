class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.20/tuicode-0.0.20-osx-arm64.tar.gz"
      sha256 "d35c77e1f561347c3d55fb83753cff9429e6a382c7ce7a9c518a0fb11458e9c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.20/tuicode-0.0.20-linux-x64.tar.gz"
      sha256 "3864584ac021fa3c15cc7a82db25bc3cab972493c9462556391c244950e8335d"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.20/tuicode-0.0.20-linux-arm64.tar.gz"
      sha256 "653ead185e9273d9ee6453b19cf99482a1b40bd6333e63d6b2ca8c21074cffe9"
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

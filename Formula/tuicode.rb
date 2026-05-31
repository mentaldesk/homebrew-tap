class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-osx-arm64.tar.gz"
      sha256 "6f7883f5f64e3ef67476fca1bf8760e1eaba1bb88d78f3f9878b5d6aa37cf4a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-x64.tar.gz"
      sha256 "4b3e904e0b95c4d45b5b0d8671472c9683d7206b29353a30ec6c74aeeacb54ae"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-arm64.tar.gz"
      sha256 "c641ff2cd59f10b80e5844decd8658c6633c4bc3a89397d195265eb2d4579d4f"
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

class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.24/tuicode-0.0.24-osx-arm64.tar.gz"
      sha256 "6b54711806499d2bc1c314046f9426f6beaed6a6ab1b408031b37b3b84edec0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.24/tuicode-0.0.24-linux-x64.tar.gz"
      sha256 "d667e90496a81acc987598e090b6c8185b135f9861cb6f490177bf7691270dd2"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.24/tuicode-0.0.24-linux-arm64.tar.gz"
      sha256 "ca71cb00fddee6640a800e606308032dc9c7bc574cdaedc99db6da85d4dc8a81"
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

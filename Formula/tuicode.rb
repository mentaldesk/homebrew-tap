class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.15/tuicode-0.0.15-osx-arm64.tar.gz"
      sha256 "0999ff6bb952d72f1ffeb32f49904e4fa7e4061e1dab72cffcbf54d6355f2e02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.15/tuicode-0.0.15-linux-x64.tar.gz"
      sha256 "c5ccd1cbb2575b9e1b9633be3d4b0f971000617e457c3d8787c09149d2faffc2"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.15/tuicode-0.0.15-linux-arm64.tar.gz"
      sha256 "c6c506a7a9111e167698ba2a67cd41bde1f969e7fc467a351be71cb0072d1dbe"
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

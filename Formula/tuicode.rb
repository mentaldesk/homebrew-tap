class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.26/tuicode-0.0.26-osx-arm64.tar.gz"
      sha256 "dea09a6bf54f18f2644446845d42fa97c2bd1fbff10a2ccd60d4063d378efc8d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.26/tuicode-0.0.26-linux-x64.tar.gz"
      sha256 "a80ee79c7013544cf03d3e34a96f92180ae494af5f37c82b4088016ac29116f5"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.26/tuicode-0.0.26-linux-arm64.tar.gz"
      sha256 "6e7b72af94e445fa17c7dd5be23635e483ebf4f07a874f1e3c1562b4388ad415"
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

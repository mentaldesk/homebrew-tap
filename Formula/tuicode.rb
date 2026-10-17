class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.22/tuicode-0.0.22-osx-arm64.tar.gz"
      sha256 "652d66e4b4729ca715baa7c404ea1b8f31bf9389bf795cb2a114453758d2833d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.22/tuicode-0.0.22-linux-x64.tar.gz"
      sha256 "ded2d19976c5b3bb1bdd1741ab3c23c6f3938d8ea9cfe8e10e10519b263a4d0f"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.22/tuicode-0.0.22-linux-arm64.tar.gz"
      sha256 "6df7ffbc4a8c7c969196c7190f7aaea7e59b8754008a07983cabc34beb9c3e46"
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

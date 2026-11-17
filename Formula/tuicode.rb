class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.20/tuicode-0.9.20-osx-arm64.tar.gz"
      sha256 "d7adafa20fedbfd042797960533e6b49d81559316d5c1cb32373e97b02faf2e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.20/tuicode-0.9.20-linux-x64.tar.gz"
      sha256 "385ecb1a42fd145229f8392c1515da09d48ad80522651ae7cc459e759b234ae1"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.20/tuicode-0.9.20-linux-arm64.tar.gz"
      sha256 "5a47cf00d25078af496f2caca64650dd3770af15f6d8b0d78845846855eb240e"
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

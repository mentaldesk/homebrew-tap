class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.4/tuicode-0.9.4-osx-arm64.tar.gz"
      sha256 "e4a7bae04bb7f76d2e758a15d55eb46a8d4769342498dd7eae35b0fae486d7d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.4/tuicode-0.9.4-linux-x64.tar.gz"
      sha256 "5a9a7e1763cf72201d68aefad0e5f48b03b5dd4439bf8a56d5ef7026dae46b70"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.4/tuicode-0.9.4-linux-arm64.tar.gz"
      sha256 "36dd11e567594b3c7d992cab9899856a94f5b8b319fa2f692bcfa4036fe8f4da"
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

class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.6/tuicode-0.9.6-osx-arm64.tar.gz"
      sha256 "9e9f3d92141daa65f4b0c87b9a6de9ff5a8b1f084db095b73f605bd485c21467"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.6/tuicode-0.9.6-linux-x64.tar.gz"
      sha256 "5e2126c2497dec34b2f6439cf4e93386f2f95f3ecc9e14417b3645e4b7bfee88"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.6/tuicode-0.9.6-linux-arm64.tar.gz"
      sha256 "ec4a9ab3aa04e9b10faeea2ff68ac6766cb5a1391e88f36358c87fb456d2e9c6"
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

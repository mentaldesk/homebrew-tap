class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.19/tuicode-0.9.19-osx-arm64.tar.gz"
      sha256 "a63fd462a61a6b60b1ba81c97e19188af4d75996fed97c51ff06a2a73007d7e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.19/tuicode-0.9.19-linux-x64.tar.gz"
      sha256 "3f794544fff66cd6ae637fd7ff2cc576bb3f47064ca34a78b0134591f1babefd"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.19/tuicode-0.9.19-linux-arm64.tar.gz"
      sha256 "2cbc14f8b90c998b487ff7215e2381bf43c06097d1633faadde6ef47d2ef2103"
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

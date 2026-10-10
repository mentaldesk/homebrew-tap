class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.14/tuicode-0.0.14-osx-arm64.tar.gz"
      sha256 "181ca7fb36fd73e0cf2fcadfc2f4f0a3ff64dd3148cb12d8beaaa5d6cb1ef859"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.14/tuicode-0.0.14-linux-x64.tar.gz"
      sha256 "6b7fc8dce7685682fc6ffcfa44c70de6b4761bd58d4e15973da093dd759a79c1"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.14/tuicode-0.0.14-linux-arm64.tar.gz"
      sha256 "d3ee32b2b7e9f2249505f1c373bcd33391361571490a08a3dd39b8a62c895789"
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

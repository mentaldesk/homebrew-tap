class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-osx-arm64.tar.gz"
      sha256 "3680f8661dae14df8219494b3af35a5ab41bb0cadb8f1271b5450a77879123b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-x64.tar.gz"
      sha256 "07913ed989e2c8492add10e50d75ff328c280e12170f8c174827434d0d928e7f"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-arm64.tar.gz"
      sha256 "64749e5b5c9b9c48f2f94b5a9c1f8a759205c71a787675f25d68af8eeeaa4c3e"
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

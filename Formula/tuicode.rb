class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-osx-arm64.tar.gz"
      sha256 "b243c0d62c08b308cac5e00e91a028f7d3a90cade73a26643f0d0548a33a51bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-x64.tar.gz"
      sha256 "c5d118330f3674fe7b43089f139ed7741ae31e5a4f00ca0882c57479c9c49746"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-arm64.tar.gz"
      sha256 "a9241a889d4bd07cfabd58a56faf7580656695568c6499f10d0285033d6257f5"
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

class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.3/tuicode-0.9.3-osx-arm64.tar.gz"
      sha256 "606cb5fb14e39dcef2c3f926cc0f8f62022033f5385d45df4194c5538d3f16de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.3/tuicode-0.9.3-linux-x64.tar.gz"
      sha256 "9fe274534622787247d1436cad03b31a6f01f2e13e9c276d2f3976c945328c55"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.3/tuicode-0.9.3-linux-arm64.tar.gz"
      sha256 "653e795ad512486ff09f0e6e845cff90f4b28c5acbdd6ee4652d364a551bdf92"
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

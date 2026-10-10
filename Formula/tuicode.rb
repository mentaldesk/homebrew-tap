class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.13/tuicode-0.0.13-osx-arm64.tar.gz"
      sha256 "5392ff0697515319579e8d2b4b37cab351264ae058ace99101c983608cd53645"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.13/tuicode-0.0.13-linux-x64.tar.gz"
      sha256 "3a98c04cb2b4d54eb235ebd604d7780d113cbbb61e0e4e5946e911467612b785"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.13/tuicode-0.0.13-linux-arm64.tar.gz"
      sha256 "1db0bf87b63aa4ee34afdc0d387a00a2412a618cb30feb5156cddb64f864fd51"
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

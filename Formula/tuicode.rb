class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.16/tuicode-0.9.16-osx-arm64.tar.gz"
      sha256 "976c885f7ea1f0ecc86ebdcc020e6486bd07b67eef66061259ec0f44dfa8bd02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.16/tuicode-0.9.16-linux-x64.tar.gz"
      sha256 "8c1ffbd6e1c6dc64a0a39c19ba9e341980b69d55707cb85f883a43fc5857723d"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.16/tuicode-0.9.16-linux-arm64.tar.gz"
      sha256 "c377144ac35dfda34752d4875d05d430e3a7fd886743f28831c00d5260b4e458"
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

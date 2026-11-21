class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.23/tuicode-0.9.23-osx-arm64.tar.gz"
      sha256 "7e08f6d556948e5d60c6961a0808c9bc6d2f42a8f502c1b6e69554ee2a349058"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.23/tuicode-0.9.23-linux-x64.tar.gz"
      sha256 "850da91fa02e997b5eb7686edab74ff705f63803f01e33fa68a4d1f6fb61b18f"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.23/tuicode-0.9.23-linux-arm64.tar.gz"
      sha256 "a896b1cfa05ae6e8462e1db5f42d8c7413f012a4bc11f8c84415b3ed8e3147e3"
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

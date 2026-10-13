class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.18/tuicode-0.0.18-osx-arm64.tar.gz"
      sha256 "53f6284dc36d46eeb77a51f968538fdc6ead79751cdd6fb47fbba92601706be3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.18/tuicode-0.0.18-linux-x64.tar.gz"
      sha256 "6ce0df797ee2f0f9ac7407d0ade93698202abc17a251cc941959360bd81d81f3"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.18/tuicode-0.0.18-linux-arm64.tar.gz"
      sha256 "a0fee2109f1d42aab56fc9c743031dabf183b9b3099533876d3266364cbe449f"
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

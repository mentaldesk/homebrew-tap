class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.5/tuicode-0.9.5-osx-arm64.tar.gz"
      sha256 "a92d00a4c720edf4ec267b6885c89ca71ce787ae27a0612080c34ddba3d67924"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.5/tuicode-0.9.5-linux-x64.tar.gz"
      sha256 "ac1dfbe92ae624852b495e0c37824b4087c9183edfdcfaa5e107eaefeb7628d9"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.5/tuicode-0.9.5-linux-arm64.tar.gz"
      sha256 "09bacbe1bad4a5825390e5e32d98bec13859219df680d152c02da84156d40020"
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

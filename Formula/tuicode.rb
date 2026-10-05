class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.9/tuicode-0.0.9-osx-arm64.tar.gz"
      sha256 "9b1ab2295604d8f4f179c2e1d2f8a8d863e19158eaa26655defd7fbfb87b2841"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.9/tuicode-0.0.9-linux-x64.tar.gz"
      sha256 "5430fcaf673e88e3f3280342ca87f746be15ac7e670ab3b4376928e2e37d25e7"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.9/tuicode-0.0.9-linux-arm64.tar.gz"
      sha256 "cc2dedccbe6fe14263b0d0a67d1bcb9510aa8315fa2952f673c6d12711f8e67d"
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

class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.26/tuicode-0.9.26-osx-arm64.tar.gz"
      sha256 "33d38928aa20da50e5a268a6ec10cc87c25144ae55f2fd6a519cf2d20abd047b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.26/tuicode-0.9.26-linux-x64.tar.gz"
      sha256 "771109fea358ab3c3af89ac2368f9e67e052953f56f74477ed8e95fb74d61ff1"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.26/tuicode-0.9.26-linux-arm64.tar.gz"
      sha256 "3266cb169248f62bf9e77b86bf6ca5a829fb0d74994423a3ccfca5104b75e78f"
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

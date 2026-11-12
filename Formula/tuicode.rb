class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.17/tuicode-0.9.17-osx-arm64.tar.gz"
      sha256 "097040ce6244c4cc5674c8d1843ab9f2f12e5294341c7a6326efe53d703e692e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.17/tuicode-0.9.17-linux-x64.tar.gz"
      sha256 "469e299a32a290beb2bea236bf94ccf83b3d7f030eceda9d812feedb02a66329"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.17/tuicode-0.9.17-linux-arm64.tar.gz"
      sha256 "ef4cebddf90e2175c54b74e07c8dfa4f916a90ad47df78e6b660e660454a8e84"
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

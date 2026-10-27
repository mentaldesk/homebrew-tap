class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.1/tuicode-0.9.1-osx-arm64.tar.gz"
      sha256 "dcb1c9ccc509cb62c12b49b32522afce5a2500e86d9e19abfe2d2bd10f60131d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.1/tuicode-0.9.1-linux-x64.tar.gz"
      sha256 "ce6decb3dcd302d119ffd5fa9e27abc1b23a40e405c0e98ea2dc532adb1e9b4f"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.1/tuicode-0.9.1-linux-arm64.tar.gz"
      sha256 "1a8233570ba2257efec85a1f709cd7b44bccc55033bf56cf1dba21948f4e71f5"
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

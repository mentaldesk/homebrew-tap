class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.25/tuicode-0.9.25-osx-arm64.tar.gz"
      sha256 "bf5d796cb5fc3a0e1c4ea1947e2d3cc61af0b0324a801c7014779245c6a75449"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.25/tuicode-0.9.25-linux-x64.tar.gz"
      sha256 "dcb78d7d4e1812b587be03363bf49ec0c513a44678ac23ce8f0d43c770f5c468"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.25/tuicode-0.9.25-linux-arm64.tar.gz"
      sha256 "cbe33c9dd43c202314012abb4b69da9d6931b141fea65a9ff1ab38c9adb7f065"
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

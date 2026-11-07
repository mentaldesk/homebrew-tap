class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.11/tuicode-0.9.11-osx-arm64.tar.gz"
      sha256 "99c6d7b9797f627144ab4607a2dbf0dd3070f285032cdd246b21e67e49b3ec01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.11/tuicode-0.9.11-linux-x64.tar.gz"
      sha256 "77041a4cd85cc25fe3e5d1dc2af334ab7757866a226dc8f644dff429020959b2"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.11/tuicode-0.9.11-linux-arm64.tar.gz"
      sha256 "2a94f80b6252e8d25baccaf903bbf70abe3ee8f0551423015ad347a9c64aeddf"
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

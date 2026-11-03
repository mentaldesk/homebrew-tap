class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.7/tuicode-0.9.7-osx-arm64.tar.gz"
      sha256 "a8342dba313745a74fd708f84e007d6412d628beb8c202d9d72343dc221e0f5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.7/tuicode-0.9.7-linux-x64.tar.gz"
      sha256 "f1cc0bf1ce05be6f145f19bec565d4ebfe37b508d96480fc83a21fd7a34f154a"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.7/tuicode-0.9.7-linux-arm64.tar.gz"
      sha256 "979404e52b7fe003968aec1a12905b1de70833c815cf9f9f17d6f5f5bdf84a6a"
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

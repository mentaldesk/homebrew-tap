class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.9/tuicode-0.9.9-osx-arm64.tar.gz"
      sha256 "8ab8c7d7f39a8a8f9a6416d5483900c400eab7afd77468808537a17d609ab1a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.9/tuicode-0.9.9-linux-x64.tar.gz"
      sha256 "99187dd24a09d4907141a39cfcf2ada75dd935e581d0829f80824ee8cc780448"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.9/tuicode-0.9.9-linux-arm64.tar.gz"
      sha256 "18e6617f892a76d66c22d6812f7f206649101aead0d46dcb6e9b9ee3eca15372"
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

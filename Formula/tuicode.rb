class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.8/tuicode-0.0.8-osx-arm64.tar.gz"
      sha256 "c9bf4fe0db80d1ac946bc730f6f97645c49626c329b28e6e06827c34fd5e7ce3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.8/tuicode-0.0.8-linux-x64.tar.gz"
      sha256 "052752d017bc25720b6bf8e0c5c868b9331112dec1c0d9c4bbb6a4526549c343"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.8/tuicode-0.0.8-linux-arm64.tar.gz"
      sha256 "2bebed805dd59469a49fdf9ec51a9e79608f93afa970cb64a1e4831e1375020a"
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

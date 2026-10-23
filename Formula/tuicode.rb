class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.25/tuicode-0.0.25-osx-arm64.tar.gz"
      sha256 "1d713a239088c23b3f45463d35e24a591ebd9c87127cc83b3319372bfb7fb3fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.25/tuicode-0.0.25-linux-x64.tar.gz"
      sha256 "fb744ce87f3812189e64f6b66ac0c4741ff072f6d965129b8a739458f3048680"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.25/tuicode-0.0.25-linux-arm64.tar.gz"
      sha256 "9dbeb41b093945e1a522ce178828107acd4e24737fdc9f91bfbc93dc33db144a"
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

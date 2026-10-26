class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.27/tuicode-0.0.27-osx-arm64.tar.gz"
      sha256 "4e236bb61f3e257d11be9a0d29b6bc88d7a79536f1a5e248f9aa665cc037de68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.27/tuicode-0.0.27-linux-x64.tar.gz"
      sha256 "7894efa997b5552b9ec31be0c11767f23e36dc551f09bd4dd5475d350b65d422"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.27/tuicode-0.0.27-linux-arm64.tar.gz"
      sha256 "f29650e7ac840d7bc95591aff9e777f4faf48d0d0aa13ed172e1b6b9a57f056a"
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

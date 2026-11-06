class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.10/tuicode-0.9.10-osx-arm64.tar.gz"
      sha256 "ed3c2e1823e96db10180e20d11321eb426493e7a00da9b27f240b89e8c0113ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.10/tuicode-0.9.10-linux-x64.tar.gz"
      sha256 "5be5d3cd5aabd0d34245e5eec388679cd0e5019d712e156d42dbf0e70fa7d494"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.10/tuicode-0.9.10-linux-arm64.tar.gz"
      sha256 "8d16c40837ada56f0583a3de48d5f19ee7d11acdbd6ad8a3598452147de11b41"
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

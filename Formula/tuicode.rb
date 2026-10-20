class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.23/tuicode-0.0.23-osx-arm64.tar.gz"
      sha256 "bc08f75aa3b57b87b658bd96fb677d05f248afefbf14e3efa8684680e629b418"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.23/tuicode-0.0.23-linux-x64.tar.gz"
      sha256 "1593ddec60c21db574e93308fdaf5d4e8bfe76f4fa8b44bdcf24987461529cc7"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.23/tuicode-0.0.23-linux-arm64.tar.gz"
      sha256 "fe0369f0d7b5df55a74923e7de18c8d5d0e8d9fee5e56bd8545a06b6e27b8776"
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

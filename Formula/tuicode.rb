class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.24/tuicode-0.9.24-osx-arm64.tar.gz"
      sha256 "3599bcba3f90de4d29d534f63b7129e6d07bd1afcde1bfefe464c3fe2c8dde7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.24/tuicode-0.9.24-linux-x64.tar.gz"
      sha256 "6b62db24cbf29a2e350ee2aefbef759e99fd98a11dac777402a5456508c7e7f8"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.9.24/tuicode-0.9.24-linux-arm64.tar.gz"
      sha256 "8a5038d277689a2693f9da337620e09197af2afe71ecf392f8d80e005b1c81cb"
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

class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.7/tuicode-0.0.7-osx-arm64.tar.gz"
      sha256 "c617c06f6b23ab5b664b27f5ce5afffb98b0cc7d4af107294d2f52a67b91e3cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.7/tuicode-0.0.7-linux-x64.tar.gz"
      sha256 "820d7afc9304a68f1cd5ab9443b802f0477b9324db6a3ee67e3ffa12506f910e"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v0.0.7/tuicode-0.0.7-linux-arm64.tar.gz"
      sha256 "4f2934f65ed3d23a894a904d3631a3f59464c00267eee610dd74127734200795"
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

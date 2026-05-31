class Tuicode < Formula
  desc "Minimalist terminal code editor for working over SSH"
  homepage "https://github.com/mentaldesk/TuiCode"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-osx-arm64.tar.gz"
      sha256 "f58c5c45861539fa3949c13022baff42ee5abba52c95cab5ce12f21e9f312f25"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-x64.tar.gz"
      sha256 "65c24f37e352acbab52413b7cbbe74554cfe75ddbeacb063990653035ae9a72c"
    end
    on_arm do
      url "https://github.com/mentaldesk/TuiCode/releases/download/v#{version}/tuicode-#{version}-linux-arm64.tar.gz"
      sha256 "a21cbdbcf7e0c1f235c96c42f705afffbdfd1a6e263248c7ffd12301a4d57dfb"
    end
  end

  # Drops an iTerm2 Dynamic Profile that maps macOS navigation/editing
  # shortcuts (Cmd+C/V/X/Z/A, Cmd+arrows, Shift+Cmd+arrows, etc.) onto the
  # CSI sequences TG's TextView understands. Bound to processes whose argv0
  # starts with "TuiCode" so it only activates inside the editor.
  # Stable GUID — reinstalls overwrite in place instead of duplicating.
  ITERM2_PROFILE_GUID = "a21365eb-a2a0-4260-b0b7-e7368856dc65".freeze
  ITERM2_PROFILE = <<~JSON.freeze
    {
      "Profiles" : [
        {
          "Bound Hosts" : ["&TuiCode*"],
          "Use Separate Colors for Light and Dark Mode" : true,
          "Rewritable" : true,
          "Name" : "TuiCode",
          "Guid" : "#{ITERM2_PROFILE_GUID}",
          "Keyboard Map" : {
            "0x7f-0x100000"   : { "Action" : 10, "Text" : "[127;6u" },
            "0xf72c-0x200000" : { "Action" : 10, "Text" : "[5~" },
            "0xf72d-0x220000" : { "Action" : 10, "Text" : "[6;2~" },
            "0xf702-0x320000" : { "Action" : 10, "Text" : "[1;2H" },
            "0xf72d-0x200000" : { "Action" : 10, "Text" : "[6~" },
            "0xf702-0x300000" : { "Action" : 10, "Text" : "[H" },
            "0xf703-0x320000" : { "Action" : 10, "Text" : "[1;2F" },
            "0xf703-0x300000" : { "Action" : 10, "Text" : "[F" },
            "0x7a-0x120000"   : { "Action" : 11, "Text" : "0x19" },
            "0xf702-0x2a0000" : { "Action" : 10, "Text" : "[1;6D" },
            "0xf703-0x280000" : { "Action" : 10, "Text" : "[1;5C" },
            "0xf703-0x2a0000" : { "Action" : 10, "Text" : "[1;6C" },
            "0xf700-0x320000" : { "Action" : 10, "Text" : "[1;6H" },
            "0xf702-0x280000" : { "Action" : 10, "Text" : "[1;5D" },
            "0xf700-0x300000" : { "Action" : 10, "Text" : "[1;5H" },
            "0xf701-0x320000" : { "Action" : 10, "Text" : "[1;6F" },
            "0x61-0x100000"   : { "Action" : 11, "Text" : "0x01" },
            "0xf701-0x300000" : { "Action" : 10, "Text" : "[1;5F" },
            "0xf72c-0x220000" : { "Action" : 10, "Text" : "[5;2~" },
            "0x78-0x100000"   : { "Action" : 11, "Text" : "0x18" },
            "0xf728-0x280000" : { "Action" : 10, "Text" : "[3;5~" },
            "0x7a-0x100000"   : { "Action" : 11, "Text" : "0x1a" },
            "0xf728-0x200000" : { "Action" : 11, "Text" : "0x04" },
            "0x76-0x100000"   : { "Action" : 11, "Text" : "0x16" },
            "0x7f-0x80000"    : { "Action" : 10, "Text" : "[127;5u" },
            "0x63-0x100000"   : { "Action" : 11, "Text" : "0x03" }
          }
        }
      ]
    }
  JSON

  def install
    bin.install "TuiCode" => "tuicode"

    # Stash the iTerm2 profile so the caveats can point at a stable path
    # (`brew uninstall` removes it cleanly).
    return unless OS.mac?

    pkgshare.mkpath
    (pkgshare/"iterm2-tuicode.json").write(ITERM2_PROFILE)
  end

  # Homebrew's post_install runs with HOME pointing at a sandbox temp dir, so a
  # formula can't write into the real ~/Library. Caveats prints the one-liner
  # the user runs themselves.
  def caveats
    return unless OS.mac?

    <<~EOS
      To enable native macOS shortcuts in iTerm2 (Cmd+C/V/X/Z/A, Cmd+arrows,
      Shift+Cmd+arrows), drop the bundled iTerm2 Dynamic Profile into place:

        install -d "$HOME/Library/Application Support/iTerm2/DynamicProfiles" && \\
          cp "#{opt_pkgshare}/iterm2-tuicode.json" \\
            "$HOME/Library/Application Support/iTerm2/DynamicProfiles/tuicode.json"

      The profile activates automatically for processes named "TuiCode".
      Restart iTerm2 if it was already running.

      For other terminal emulators (WezTerm, Ghostty, …), see:
        https://github.com/mentaldesk/TuiCode/issues/40
    EOS
  end

  test do
    assert_predicate bin/"tuicode", :executable?
  end
end

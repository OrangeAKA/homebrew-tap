cask "pillfloat" do
  version "1.2.1"
  sha256 "c974120dad826b6a12bad27f0c4f609a178483f0425b640b7fd3a2a22e18b54f"

  url "https://github.com/OrangeAKA/pillfloat/releases/download/v#{version}/PillFloat.app.zip"
  name "PillFloat"
  desc "Reposition the Wispr Flow dictation pill anywhere on your screen"
  homepage "https://github.com/OrangeAKA/pillfloat"

  depends_on macos: ">= :ventura"

  app "PillFloat.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/PillFloat.app"],
                   sudo: false
    # Reset stale Accessibility TCC entry so macOS prompts fresh after binary update
    system_command "/usr/bin/tccutil",
                   args: ["reset", "Accessibility", "com.krishnaakhil.pillfloat"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.krishnaakhil.pillfloat.plist",
  ]
end

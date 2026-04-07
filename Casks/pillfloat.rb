cask "pillfloat" do
  version "1.2.0"
  sha256 "b65e2d4189aa9c20fae41d4adbc56c584474b803e92f49b0f455795ca28adeae"

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

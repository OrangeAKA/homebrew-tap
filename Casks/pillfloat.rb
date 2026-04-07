cask "pillfloat" do
  version "1.3.4"
  sha256 "d1bcfb78fd0ada11f19dfea3c99567d8b3216b196ea151f1fc4d70f5dfd59d1c"

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
    # Clear stale Accessibility permission on upgrade (ignore errors on clean install)
    system_command "/usr/bin/tccutil",
                   args: ["reset", "Accessibility", "com.krishnaakhil.pillfloat"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/com.krishnaakhil.pillfloat.plist",
  ]
end

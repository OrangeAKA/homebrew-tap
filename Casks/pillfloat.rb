cask "pillfloat" do
  version "1.3.1"
  sha256 "3bb8179cf8e158755f3e8285e42af2a3593ffe0eea8e592a72f9bd3e8002c9e3"

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
  end

  zap trash: [
    "~/Library/Preferences/com.krishnaakhil.pillfloat.plist",
  ]
end

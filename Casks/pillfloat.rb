cask "pillfloat" do
  version "1.0.1"
  sha256 "ff89ff7c8fb27eafec70a90d97a82fd74ecf14c75d951468a946e2f360803b8c"

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

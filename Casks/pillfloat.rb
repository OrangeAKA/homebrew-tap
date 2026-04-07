cask "pillfloat" do
  version "1.0.4"
  sha256 "700acab32b82a49ef1b94685cfb2d189096d84166136bc4a41b7eef1efbdf446"

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

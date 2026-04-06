cask "pillfloat" do
  version "1.0.0"
  sha256 "5a928fd3e310eeb255fe801a37c55f45c602f42f27fa2704ec28168b2ffe09a5"

  url "https://github.com/OrangeAKA/pillfloat/releases/download/v#{version}/PillFloat.app.zip"
  name "PillFloat"
  desc "Reposition the Wispr Flow dictation pill anywhere on your screen"
  homepage "https://github.com/OrangeAKA/pillfloat"

  depends_on macos: ">= :ventura"

  app "PillFloat.app"

  zap trash: [
    "~/Library/Preferences/com.krishnaakhil.pillfloat.plist",
  ]
end

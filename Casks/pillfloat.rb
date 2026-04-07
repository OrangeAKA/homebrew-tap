cask "pillfloat" do
  version "1.3.2"
  sha256 "7835c3a0514e7af50317737ce0e94ec703e9c6f37b3b46ef294e252edf65e28f"

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

# Override screenrecord menu to add "No audio" option
# Uses local patched script (VFR instead of CFR) to avoid stutter on 59.95 Hz monitors
# See: omarchy commit a4303e17 which added -fm cfr for kdenlive import convenience
SCREENRECORD="$HOME/.config/omarchy/bin/omarchy-cmd-screenrecord"

show_screenrecord_menu() {
  "$SCREENRECORD" --stop-recording && exit 0

  case $(menu "Screenrecord" "  No audio\n  With desktop audio\n  With desktop + microphone audio\n  With desktop + microphone audio + webcam") in
  *"No audio") "$SCREENRECORD" ;;
  *"With desktop audio") "$SCREENRECORD" --with-desktop-audio ;;
  *"With desktop + microphone audio") "$SCREENRECORD" --with-desktop-audio --with-microphone-audio ;;
  *"With desktop + microphone audio + webcam")
    local device=$(show_webcam_select_menu) || { back_to show_capture_menu; return; }
    "$SCREENRECORD" --with-desktop-audio --with-microphone-audio --with-webcam --webcam-device="$device"
    ;;
  *) back_to show_capture_menu ;;
  esac
}

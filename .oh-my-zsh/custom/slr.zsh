function getvirtcam() {
  v4l2-ctl --list-devices | awk '/VirtualCam/{getline; print $1}'
}

function cam() {
  loopback=$(getvirtcam)
  if [[ -z $loopback ]]; then
    echo "Loopback device not found, creating one"
    sudo modprobe v4l2loopback devices=1 max_buffers=2 exclusive_caps=1 card_label="VirtualCam"
    sleep 5
  fi

  gphoto2 --stdout --capture-movie | \
    ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 $loopback
}

function campreview() {
  gphoto2 --stdout --capture-movie | ffplay -
}

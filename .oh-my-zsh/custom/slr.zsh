function cam() {
  loopback=/dev/video4
  gphoto2 --stdout --capture-movie | \
    ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 $loopback
}

function campreview() {
  gphoto2 --stdout --capture-movie | ffplay -
}

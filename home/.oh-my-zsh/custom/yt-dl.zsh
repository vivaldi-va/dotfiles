function ytdl_playlist() {
  if [  $# -lt 1 ]; then
    echo "Usage: \n \
      $0 <playlist ID>" >&2
  fi

  yt-dlp -t mp4 -o "%(channel)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" https://www.youtube.com/playlist\?list\=$1
}

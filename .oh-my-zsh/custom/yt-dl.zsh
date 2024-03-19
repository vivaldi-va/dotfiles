function ytdl_playlist() {
  if [  $# -lt 1 ]; then
    echo "Usage: \n \
      $0 <playlist ID>" >&2
  fi

  yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" https://www.youtube.com/playlist?$1
}

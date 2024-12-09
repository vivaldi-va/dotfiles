function ytdl_playlist() {
  if [  $# -lt 1 ]; then
    echo "Usage: \n \
      $0 <playlist ID>" >&2
  fi

  yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" https://www.youtube.com/playlist\?list\=$1
}

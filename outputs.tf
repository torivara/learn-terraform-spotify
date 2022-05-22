output "demo-playlist" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.community-demo-playlist.id}"
  description = "Terraform demo playlist"
}

output "kubernetes-demo-playlist" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.kubernetes-playlist.id}"
  description = "Kubernetes demo playlist"
}

# output "tracks" {
#   value = data.spotify_search_track.tracksearch
# }

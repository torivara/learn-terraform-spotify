terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "artist1" {
  artist = var.artist1
}

data "spotify_search_track" "artist2" {
  artist = var.artist2
  album  = "Barenaked ladies are me"
}

data "spotify_search_track" "artist3" {
  artist = var.artist3
}

data "spotify_search_track" "artist4" {
  artist = var.artist4
}

resource "spotify_playlist" "community-demo-playlist" {
  name        = "Terraform Community Demo Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.artist1.tracks[0].id,
    data.spotify_search_track.artist1.tracks[1].id,
    data.spotify_search_track.artist1.tracks[2].id,
    data.spotify_search_track.artist2.tracks[0].id,
    data.spotify_search_track.artist2.tracks[1].id,
    data.spotify_search_track.artist2.tracks[2].id,
    data.spotify_search_track.artist3.tracks[0].id,
    data.spotify_search_track.artist3.tracks[1].id,
    data.spotify_search_track.artist3.tracks[2].id,
    data.spotify_search_track.artist4.tracks[0].id,
    data.spotify_search_track.artist4.tracks[1].id,
    data.spotify_search_track.artist4.tracks[2].id,
  ]
}

locals {
  tracks = {
    track1 = {
      name   = "pod"
      artist = "flook"
    }
    track2 = {
      name   = "crash loop"
      artist = "klaus schulze"
    }
    track3 = {
      name   = "service"
      artist = "fally ipupa"
    }
    track4 = {
      name   = "ingress"
      artist = "james bernard"
    }
    track5 = {
      name   = "cluster fuck"
      artist = "aithavirus"
    }
    track6 = {
      name   = "deployment"
      artist = "朧"
    }
  }
}

data "spotify_search_track" "tracksearch" {
  for_each = local.tracks

  name   = each.value.name
  artist = each.value.artist
}

resource "spotify_playlist" "kubernetes-playlist" {
  name        = "Terraform Community Kubernetes Demo Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.tracksearch["track1"].tracks[0].id,
    data.spotify_search_track.tracksearch["track2"].tracks[0].id,
    data.spotify_search_track.tracksearch["track3"].tracks[0].id,
    data.spotify_search_track.tracksearch["track4"].tracks[0].id,
    data.spotify_search_track.tracksearch["track5"].tracks[0].id,
    data.spotify_search_track.tracksearch["track6"].tracks[0].id
  ]
}

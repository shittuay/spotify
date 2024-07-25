resource "spotify_playlist" "naija" {
    name        = "Naija"
    tracks = ["4zmZ8lVLzGc84S4v2B1rLx"]
  
}

data "spotify_search_track" "seyi_vibes" {
    artist = "seyi_vibes"
  
}

resource "spotify_playlist" "all_seyi_vibes_song" {
    name        = "all_seyi_vibes_song"
    tracks = [
      data.spotify_search_track.seyi_vibes.tracks[0].id,
      data.spotify_search_track.seyi_vibes.tracks[1].id,
      data.spotify_search_track.seyi_vibes.tracks[2].id,
      data.spotify_search_track.seyi_vibes.tracks[3].id,
      data.spotify_search_track.seyi_vibes.tracks[4].id,
      data.spotify_search_track.seyi_vibes.tracks[5].id,
      data.spotify_search_track.seyi_vibes.tracks[6].id,
      data.spotify_search_track.seyi_vibes.tracks[7].id,
      data.spotify_search_track.seyi_vibes.tracks[8].id,
      
    ]
}
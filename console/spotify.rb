require 'rspotify'

class Spotify
	def initialize
	end

	def search_track(track, artist)
		puts "Searching Spotify for #{track} by #{artist}"
		spot_track = RSpotify::Track.search("#{track} #{artist}")

		if spot_track != nil
			puts "Tracks found #{spot_track.total}"
			puts "Found track! #{spot_track.first.name} by #{spot_track.first.artists.first.name}"
		else
			puts "Unable to fund track"
		end
	end
end
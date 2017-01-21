require 'cinch'
load 'spotify.rb'

class TwitchChat
	@@client = nil # Twitch client

	def initialize
	end

	def setup
		@@client = Cinch::Bot.new do
			configure do |c|
				c.server = "irc.chat.twitch.tv"
				c.channels = ["#monstercat"]
				c.nick = "username"
				c.password = "oauth:<token>"
			end

			on :channel, /Now Playing/ do |chanmessage|
				now_playing_spl = chanmessage.message.split("-")
				track_artist_spl = now_playing_spl[0].split(":")
				track_spl = track_artist_spl[1].strip.split("by")
				@@spotify = Spotify.new
				@@spotify.search_track(track_spl[0], track_spl[1])
			end
		end
	end

	def run
		@@client.start
	end
end
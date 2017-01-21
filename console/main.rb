load "twitchchat.rb"

module MonstercatConsole
	@@twitch = TwitchChat.new

	def self.run
		print "Starting"

		@@twitch.setup

		@@twitch.run

		print "Closing down"
	end
end

MonstercatConsole.run

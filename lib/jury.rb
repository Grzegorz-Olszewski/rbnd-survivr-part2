class Jury
	attr_accessor :members
	def initialize 
		@members = []
	end 
	def add_member (member)
		self.members.push(member)
	end	
	def cast_votes(finalists)
		@finalists = Hash[finalists.map {|key| [key.name, 0]}]
		keys = @finalists.keys
		@members.each do |member|
			voted = keys.sample
			puts "#{member} voted for #{voted}." 
			@finalists[voted] +=1
		end
		@finalists
		
	end
	def report_votes(votes)
		keys = votes.keys
		puts "#{keys[0]} #{votes[keys[0]]}"
		puts "#{keys[1]} #{votes[keys[1]]}"
	end
	def announce_winner(votes)
		values = votes.values
		puts "The winner is #{votes.key(values.max)}."
		votes.key(values.max)
	end
end
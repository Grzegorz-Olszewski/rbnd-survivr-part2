class Game
	attr_accessor :tribes
	def initialize(tribe_one,tribe_two)
		@tribes = []
		@tribes = tribes
		@tribes.push(tribe_one,tribe_two)
	end
	def add_tribe(tribe)
		@tribes.push(tribe)
	end
	def immunity_challenge
		self.tribes.sample
	end
	def clear_tribes
		@tribes = []
	end
	def merge(name)
		new_tribe = Tribe.new({name: name, members:self.tribes[0].members+self.tribes[1].members})
		clear_tribes
		add_tribe(new_tribe)
		new_tribe
	end
	def individual_immunity_challenge
		tribe = @tribes.sample
		immune = tribe.members.sample
		print "#{immune} is safe"
		immune
	end
end
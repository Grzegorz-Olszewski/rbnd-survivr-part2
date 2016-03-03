class Contestant
	attr_reader :name
	def initialize(name)
		@name = name
	end
	def to_s
		@name
	end
end
class Tribe 
	attr_reader :name
	attr_accessor :members, :immune
	def initialize (options={})
		@name = options[:name]
		@members = []
		options[:members].each do |member|
			@members.push(member)
		end
		puts @members
	end
	def to_s
		self.name
	end
	def tribal_council(options = {})
		for_vote = members
		for_vote.delete(options[:immune])
		for_vote.sample
	end
end

@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }
@coyopa = Tribe.new({name: "Pagong", members: @contestants.shift(10)})
@hunapu = Tribe.new({name: "Tagi", members: @contestants.shift(10)})
immune = @coyopa.members.first
p @coyopa.tribal_council(immune: immune)
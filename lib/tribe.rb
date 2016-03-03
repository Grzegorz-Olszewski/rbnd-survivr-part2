class Tribe 
	attr_reader :name
	attr_accessor :members, :immune
	def initialize (options={})
		@name = options[:name].blue
		@members = options[:members]
		print "\nMembers of #{@name} are:"
		@members.each_with_index do |member,i|
			if i < @members.length - 1
				print " #{member},"
			else
				print " #{member}."
			end
		end
		print "\n"
	end
	def to_s
		@name
	end
	def tribal_council(options = {})
		immune = options[:immune]
		deleted = false
		while deleted == false do
			choosen = @members.sample
			if  choosen != immune
				@members.delete(choosen)
				deleted = true
			end
		end
		choosen
	end
end	
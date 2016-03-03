require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require "colorizr"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================
def printing_rounds(i)
		print "Round #{i+1}: "
end

#This is where you will write your code for the three phases
def phase_one
	print "\n*****Phase one*****\n\n".red
	8.times do |i|
		printing_rounds(i)
		immune = @borneo.individual_immunity_challenge
		if @coyopa.members.include?(immune)
			out = @coyopa.tribal_council(immune: immune)
		else
			out = @hunapu.tribal_council(immune: immune)
		end
		print " and #{out} is out.\n"
	end
end

def phase_two
	print "*****Phase two*****\n\n".red
	3.times do |i|
		printing_rounds(i)
		immune = @borneo.individual_immunity_challenge
		out = @merge_tribe.tribal_council(immune: immune)
		print " and #{out} is out.\n"
	end
end

def phase_three 
	print "*****Phase three*****\n\n".red
	7.times do |i|
		printing_rounds(i)
		immune = @borneo.individual_immunity_challenge
		new_member = @merge_tribe.tribal_council(immune: immune)
		print ", #{new_member} is out and becomes a member of a jury.\n"
		@jury.add_member(new_member)

	end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
puts

phase_two #3 more eliminations
@jury = Jury.new
puts

phase_three #7 elminiations become jury member
finalists = @merge_tribe.members #set finalists

print "\n*****Voting***** \n\n".red

vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner

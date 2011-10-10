#!/usr/bin/ruby

#parses the specific sgfs that Castro produces, not a general purpose parser
#takes an io object
#calls a callback when a node is added or removed from the stack
def castro_sgf_parse(fd)
	fd.each{|line|
		line = line.strip

		next if line.length == 0
		next if line.scan(/^\(;FF\[4\]/).length > 0
		next if line.scan(/^;[BW]/).length > 0 #should replace root, not quite sure how best to do that

		if(line == ")" || line == "))")
			yield nil
			next
		end

		match = line.scan(/^\W*\(;([BW])\[([a-z0-9]+)\]C\[([^\]]*)\](\)?)/)

		raise "Multiple matches?" if match.length > 1
		raise "No match?"         if match.length == 0

		side, move, comment, pop = match[0]
		comment = comment.split(", ").map{|a| a.split ':'}
		props = Hash[comment]
		props[comment[0][0]] = true
		yield [side, move, props, (pop.length > 0)]
	}
end



fd = (ARGV[0] && ARGV[0] != '-' ? File.open(ARGV[0]) : $stdin)

limit = (ARGV[1] || 1).to_i


puts "\\node {root}"
depth = 1
stack = []
castro_sgf_parse(fd){|node|
	if node
		side, move, props, pop = node

		output = props['sims'].to_i > limit

		if(output)
			print "\t"*depth
			print "child { node ["

			print "ww" if side == "W" && props['outcome'] == '1'
			print "wb" if side == "W" && props['outcome'] == '2'
			print "bw" if side == "B" && props['outcome'] == '1'
			print "bb" if side == "B" && props['outcome'] == '2'

			print "] {#{move}}"
		end

		if(pop)
			print " }" if output
		else
			stack << output
			depth += 1
		end
		print "\n" if output
	else
		depth -= 1
		output = stack.pop
		print "\t"*depth, "}\n" if output
	end
}
puts ";"


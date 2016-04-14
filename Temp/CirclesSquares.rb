#!/usr/bin/ruby

# CirclesSquares.rb
#
# Calculates the total number of nested circles and squares
# that are possible given a starting width
#
# Assumes width and height are equal for all shapes

# Base class for all geometric shapes
class Shape
	
	def initialize(left, top)
		@left = left
		@top = top
	end

end

class Square < Shape

	def initialize(left, top, width)
		super(left, top)
		@width = width
	end

	def draw()
		left = @left.round(2)
		top = @top.round(2)
		width = @width.round(2)
		area = self.area().round(2)
		
		puts "[Square] Left:#{left} Top:#{top} Width:#{width} Area:#{area}"
	end

	def area()
		return @width*@width
	end

end

class Circle < Shape

	def initialize(left, top, width)
		super(left, top)
		@radius = 0.5 * width
	end

	def draw()
		left = @left.round(2)
		top = @top.round(2)
		width = (2*@radius).round(2)
		area = self.area().round(2)
		
		puts "[Circle] Left:#{left} Top:#{top} Width:#{width} Area:#{area}"
	end

	def area()
		return Math::PI * (@radius**2)
	end

	# Returns the distance from the left border and from the top border
	# of the point on the circle closest to the origin (0,0)
	def OffsetFromClosestPointToOrigin ()
		offset = @radius - Math.sqrt(0.5 * @radius**2)
		return offset,offset
	end

end

# Begin iterating with squares and inscribed circles
left = 0
top = 0
width = 1000

counter = 0

loop do 
	counter += 1
	puts "\nIteration #{counter}:"

	# Draw the objects
	theSquare = Square.new(left, top, width)
	theSquare.draw()
	
	theCircle = Circle.new(left, top, width)
	theCircle.draw()
	
	# Determine properties of next iteration
	xOffset,yOffset = theCircle.OffsetFromClosestPointToOrigin()
	left += xOffset
	top += yOffset
	width = width - 2*xOffset  # Offset of left and right sides
	
	break if theCircle.area < 1
end 

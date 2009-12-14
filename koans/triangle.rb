# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # each value must be greater than 0
  raise TriangleError if [a, b, c].find {|x| x<=0}
  # sum of all sides minus the max side must be less than max
  sum = [a,b,c].inject() {|s,x| s+x}
  max = [a,b,c].max
  raise TriangleError if (sum-max <= max)
  case [a,b,c].uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

# Example: bit ugly but follows a certain procedural train of thought
# based on exhaustive comparison of each element to each element
# :scalene is that side a is not the same as side b is not the same as side c
# :equilateral if side a is equal to side b AND b to side c (therefore a == c)
# def triangle2(a, b, c)
#   if a!=b && b!=c && a!=c
#     :scalene
#   elsif a == b && b == c
#     :equilateral
#   else
#     :isosceles #assume that two sides are equal
#   end
# end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

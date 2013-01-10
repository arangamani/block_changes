#
# Copyright (c) 2012 Kannan Manickam <arangamani.kannan@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

require File.expand_path('../../lib/block_changes', __FILE__)

include BlockChanges

puts "[BEFORE] Changes detected: #{changes_detected?}"

# Some variables are defined
some_var = 5
some_hash = { :var => 5 }
some_array = [4, 5, 'str']
detect_changes('some_var', 'some_hash', 'some_array') do
  some_var = 6
  some_hash[:var] = 6
  some_array[0] += 1
end

puts "some_var = #{some_var}"
puts "some_hash = #{some_hash}"
puts "some_array = #{some_array}"
puts "[AFTER] Changes detected: #{changes_detected?}"
puts "[AFTER] No of changes: #{get_changes}"

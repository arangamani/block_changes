#
# Copyright (c) 2013 Kannan Manickam <arangamani.kannan@gmail.com>
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

module BlockChanges

  # Version information
  MAJOR   = 0
  MINOR   = 0
  TINY    = 1
  PRE     = nil
  VERSION = [MAJOR, MINOR, TINY, PRE].compact.join('.')

  @changes_detected = nil
  @no_of_block_changes = 0

  def changes_detected?
    @changes_detected
  end

  def reset_changes
    @changes_detected = nil
    @no_of_block_changes = 0
  end

  def get_changes
    @no_of_block_changes
  end

  def detect_changes(*vars, &block)
    # Reset changes done in the previous block if any
    reset_changes

    # Collect all variables and put it in an array
    old_vars = []
    vars.each do |var|
      var_eval = eval(var, block.binding)
      if var_eval.is_a?(Hash) || var_eval.is_a?(Array)
        var_eval = var_eval.clone
      end
      old_vars << var_eval
    end

    # Execute the block
    block.call

    # Obtain the variables after the block execution
    new_vars = []
    vars.each do |var|
      var_eval = eval(var, block.binding)
      if var_eval.is_a?(Hash) || var_eval.is_a?(Array)
        var_eval = var_eval.clone
      end
      new_vars << var_eval
    end

    # Check if there were any changes detected during block execution
    vars.each_with_index do |_, index|
      @no_of_block_changes += 1 if old_vars[index] != new_vars[index]
    end
    @changes_detected = @no_of_block_changes > 0
  end
end

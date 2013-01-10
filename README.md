Block Changes
=============
[![Build Status](https://travis-ci.org/arangamani/block_changes.png?branch=master)](https://travis-ci.org/arangamani/block_changes)
[![Dependency Status](https://gemnasium.com/arangamani/block_changes.png)](https://gemnasium.com/arangamani/block_changes)

Detecting changes in a Ruby block
---------------------------------
The following example illustrates how to see if changes are detected in a Ruby block for the expected variables. Variables a, b, c are concerned in this example. If these variables are changed `changes_detected?` will return true. If these variables are not changes in the block `changes_detected?` will return false. This will be helpful to maintain idempotency. The following example is very simple. We'll know what variables we concern about when we write the code so passing those variables to the code will not be hard. Also we might not want to detect changes of local temporary variables defined inside the block.

```ruby
require 'block_changes'

include BlockChanges

a = 1
b = 2
c = 3

# Note that the variable names are in quotes and it is required.
detect_changes('a', 'b', 'c') do
  a = 2
  b = 3
  c = 4
end

# Check if changes are detected in the block
puts "Changes Detected" if changes_detected?

# Check the number variables changed in the block
puts "No of changes: #{get_changes}"
```

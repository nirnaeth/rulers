require "rack/test"
require "test/unit"

# Always use local Rulers first
# `expand_path` so it's absolute.
# this is important if something changes the current directory
# `unshift` to prepend.
dir = File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH.unshift File.expand_path(dir)

require "rulers"

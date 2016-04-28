def benchmark
  # Your benchmarking code goes here.
 	start_time = Time.new
 	yield
 	end_time = Time.new
 	(end_time - start_time)*1000
end
 
# Be careful, pasting this into IRB will take a long time to print.
# It's a loooong string. :)
long_string = "apple"*10
 
running_time = benchmark { long_string.reverse }
 
puts "string.reverse took #{running_time} seconds to run"
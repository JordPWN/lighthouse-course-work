list = {'yvr' => 'Vancouver', 'yba' => 'Banff', 'yyz' => 'Toronto', 'yxx' => 'Abbotsford', 'ybw' => 'Calgary'}

# Why is it returning nil instead of first element of the list above
p list[0]
# The above variable is a hash, and as such does not use indexes
p list.keys[0]
p list.values[0]
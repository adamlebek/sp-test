
require_relative 'lib/views_counter'

logs = Counter.new(ARGV[0])

puts 'All views:'
puts logs.count_views
puts 'Unique views:'
puts logs.count_unique_views
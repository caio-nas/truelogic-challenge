require_relative 'app/service/weather_service'
require_relative 'app/service/soccer_service'

task default: %w[test]

task :test do
  sh 'bundle exec rspec -fd'
end

task :smallest_temperature_spread_day, [:file_path] do |t, args|
  args.with_defaults(file_path: 'data/weather.dat')
  path = args[:file_path].to_s.strip

  puts WeatherService.smallest_temperature_spread_day(File.foreach(path))
rescue StandardError => e
  puts "Failed to execute smallest_temperature_spread_day. Reason: #{e.message}"
end

task :smallest_absolute_goal_difference, [:file_path] do |t, args|
  args.with_defaults(file_path: 'data/soccer.dat')
  path = args[:file_path].to_s.strip

  puts SoccerService.smallest_absolute_goal_difference(File.foreach(path))
rescue StandardError => e
  puts "Failed to execute smallest_absolute_goal_difference. Reason: #{e.message}"
end

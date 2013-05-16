Dir.chdir(File.dirname(__FILE__)) do
  Dir.glob('**/test_*.rb') { |filename| require './' + filename }
end

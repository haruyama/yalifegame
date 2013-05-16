require 'English'
require 'yalifegame/version'

Gem::Specification.new do |gem|
  gem.name                  = 'yalifegame'
  gem.version               = YALifeGame::VERSION
  gem.required_ruby_version = '>= 1.9.3'
  gem.summary               = %Q{yet another life game library}
  gem.description           = %Q{Yet another life game library which can enumurate father patterns.}
  gem.authors               = ['HARUYAMA Seigo']
  gem.email                 = ['haruyama@unixuser.org']
  gem.licenses              = ['MIT']
  gem.homepage              = 'https://github.com/haruyama/yalifegame'
  gem.files                 = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables           = gem.files.grep(/\Abin\//).map { |f| File.basename(f) }
  gem.test_files            = gem.files.grep(/\A(test|spec|features)\//)
  gem.require_paths         = ['lib']
end

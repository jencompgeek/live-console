$:.unshift File.expand_path("../lib", __FILE__)

require 'version'

spec = Gem::Specification.new { |s|
	s.platform = "ruby"
	s.author = ["Pete Elmore", "Jennifer Hickey"]
	s.homepage = "https://github.com/jencompgeek/live-console"
	s.email = "jencompgeek@gmail.com"
	s.files = %w(LICENSE README examples/lc_example.rb examples/lc_unix_example.rb bin/udscat) + Dir.glob("{lib}/**/*")
	s.require_path = "lib"
	s.has_rdoc = true
	s.extra_rdoc_files = ["LICENSE", "README", "examples/lc_example.rb", "examples/lc_unix_example.rb"]
	s.extensions = []
	s.executables = ["udscat"]
	s.name = "live_console"
	s.description = s.summary = "A library to support adding an irb console to your running application."
	s.version = LiveConsole::VERSION
}

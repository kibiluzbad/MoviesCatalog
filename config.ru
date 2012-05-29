$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'src/movies_catalog'

log = File.new('log/sinatra.log', 'a')
STDOUT.reopen(log)
STDERR.reopen(log)

run Sinatra::Application

require 'bundler/setup'
require 'logger'

require './nosher'

$stdout.sync = true

use Rack::CommonLogger

run Nosher

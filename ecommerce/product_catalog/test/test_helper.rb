require "active_record"
require "minitest/autorun"
require "mutant/minitest/coverage"
require "arkency/command_bus"

require_relative "../../../infra/lib/cqrs"
require_relative "../../../infra/lib/test_plumbing"

ActiveRecord::Base.establish_connection("sqlite3::memory:")
ActiveRecord::Schema.verbose = false

require_relative "../lib/product_catalog"

require 'struct_pluck'
require 'active_record'
require 'yaml'
require 'factory_girl'
require 'rspec'

database_config = YAML.load_file(File.expand_path("../database.yml", __FILE__))
ActiveRecord::Base.establish_connection database_config["test"]

class TextArrayRecord < ActiveRecord::Base
end

class VarcharArrayRecord < ActiveRecord::Base
end

class NormalTable < ActiveRecord::Base
end

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.around do |example|
    if example.metadata[:disable_transactions]
      example.call
    else
      ActiveRecord::Base.transaction do
        begin
          example.call
        ensure
          raise ActiveRecord::Rollback
        end
      end
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

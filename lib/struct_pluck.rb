require 'struct_pluck/version'
require 'active_record'

module StructPluck
  class UnsupportedDatatype < StandardError
  end

  # Your code goes here...
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def struct_pluck(column_names)
      result = pluck(*column_names)
      fakerecord = Struct.new(*column_names)
      result.map do |r|
        fail UnsupportedDatatype if r.size != column_names.size
        fakerecord.new(*r)
      end
    end
  end
end

ActiveRecord::Base.send(:include, StructPluck)

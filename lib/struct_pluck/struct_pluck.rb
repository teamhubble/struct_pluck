require 'active_record'

module StructPluck
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def struct_pluck(column_names)
      result = pluck(*column_names)
      fakerecord = Struct.new(*column_names)
      result.map { |r| fakerecord.new(*r) }
    end
  end
end

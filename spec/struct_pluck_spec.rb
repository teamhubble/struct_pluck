require 'spec_helper'

describe StructPluck do
  context 'TextArrayRecord' do
    it 'should show unsupported datatype' do
      TextArrayRecord.create! texts: %w(a b)
      expect do
        TextArrayRecord.struct_pluck([:texts])
      end.to raise_error(StructPluck::UnsupportedDatatype)
    end
  end

  context 'VarcharArrayRecord' do
    it 'should show unsupported datatype' do
      VarcharArrayRecord.create!(varchars: %w(a b))
      expect do
        VarcharArrayRecord.struct_pluck([:varchars])
      end.to raise_error(StructPluck::UnsupportedDatatype)
    end
  end

  context 'NormalTable' do
    it 'should fetch keys' do
      NormalTable.create! name: 'dummy', tax: 32
      plucked = NormalTable.struct_pluck([:name, :tax])
      expect(plucked.size).to eq(1)
      item_hash = plucked.first.to_h
      expect(item_hash).to include(:name, :tax)
      expect(item_hash).to eq(name: 'dummy', tax: 32)
    end
  end
end

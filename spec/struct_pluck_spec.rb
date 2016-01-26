require 'spec_helper'

describe StructPluck do
  context 'TextArrayRecord' do
    it 'should show unsupported datatype' do
      TextArrayRecord.create! texts: %w{a b}
      expect { TextArrayRecord.struct_pluck([:texts]) }.to raise_error(StructPluck::UnsupportedDatatype)
    end
  end

  context 'VarcharArrayRecord' do
    it 'should show unsupported datatype' do
      item = VarcharArrayRecord.create!(varchars: %w{a b})
      expect { VarcharArrayRecord.struct_pluck([:varchars]) }.to raise_error(StructPluck::UnsupportedDatatype)
    end
  end

  context 'NormalTable' do
    it 'should fetch keys' do
      item = NormalTable.create! name: 'dummy', tax: 32
      plucked = NormalTable.struct_pluck([:name, :tax])
      expect(plucked.size).to eq(1)
      item_hash = plucked.first.to_h
      expect(item_hash).to include(:name, :tax)
      expect(item_hash).to eq(name: 'dummy', tax: 32)
    end
  end
end

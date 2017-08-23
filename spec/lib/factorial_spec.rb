require 'rails_helper'

describe Integer do
  context '#factorial' do
    context 'border cases' do
      it { expect(0.factorial).to eq(1) }
      it { expect { -1.factorial }.to raise_error(ArgumentError) }
    end

    it { expect(1.factorial).to eq(1) }
    it { expect(2.factorial).to eq(2) }
    it { expect(5.factorial).to eq(120) }
    it { expect(20.factorial).to eq(20.downto(1).inject(:*)) }
    it { expect(200.factorial).to eq(200.downto(1).inject(:*)) }
    it { expect(1000.factorial).to eq(1000.downto(1).inject(:*)) }
  end

  context '#count_end_zeros' do
    context 'border cases' do
      it { expect(0.count_end_zeros).to eq(1) }
      it { expect(1.count_end_zeros).to eq(0) }
      it { expect(1283.count_end_zeros).to eq(0) }
    end

    it { expect(10.count_end_zeros).to eq(1) }
    it { expect(100.count_end_zeros).to eq(2) }
    it { expect(1000.count_end_zeros).to eq(3) }
    it { expect(10_000.count_end_zeros).to eq(4) }

    # Factorial and count zeros test
    it { expect(5.factorial.count_end_zeros).to eq(1) }
    it { expect(13.factorial.count_end_zeros).to eq(2) }
    it { expect(20.factorial.count_end_zeros).to eq(4) }
    it { expect(25.factorial.count_end_zeros).to eq(6) }
  end
end

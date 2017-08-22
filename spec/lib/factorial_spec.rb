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
end

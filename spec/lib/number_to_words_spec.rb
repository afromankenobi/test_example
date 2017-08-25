require 'rails_helper'

describe Integer do
  context '#to_words' do
    it { expect(0.to_words).to eq('cero') }
    it { expect(1.to_words).to eq('uno') }
    it { expect(8.to_words).to eq('ocho') }
    it { expect(12.to_words).to eq('doce') }
    it { expect(50.to_words).to eq('cincuenta') }
    it { expect(84.to_words).to eq('ochenta y cuatro') }
    it { expect(100.to_words).to eq('cien') }
    it { expect(134.to_words).to eq('ciento treinta y cuatro') }
    it { expect(612.to_words).to eq('seiscientos doce') }
    it { expect(1000.to_words).to eq('mil') }
    it { expect(2000.to_words).to eq('dos mil') }
    it { expect(5409.to_words).to eq('cinco mil cuatrocientos nueve') }
    it { expect(10_902.to_words).to eq('diez mil novecientos dos')}
    it { expect(12_500.to_words).to eq('doce mil quinientos')}
    it { expect(77_884.to_words).to eq('setenta y siete mil ochocientos ochenta y cuatro')}
    it { expect(100_000.to_words).to eq('cien mil')}
    it { expect(999_999.to_words).to eq('novecientos noventa y nueve mil novecientos noventa y nueve')}
    it { expect(1_000_000.to_words).to eq('un millon')}
    it { expect(999_999_999.to_words).to eq('novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve')}
    it { expect(1_999_999_999.to_words).to eq('mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve')}
    it { expect(11_999_999_999.to_words).to eq('once mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve')}
    it { expect(111_999_999_999.to_words).to eq('ciento once mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve')}
    it { expect(1_000_000_000_000.to_words).to eq('un billon') }
    it { expect(1_111_999_999_999.to_words).to eq('un billon ciento once mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve')}
    it { expect(1_000_000_000_000_000_000.to_words).to eq('un trillon')}
    it { expect(1_321_654_865_748_651_456.to_words).to eq('un trillon trescientos veinte y un mil seiscientos cincuenta y cuatro billones ochocientos sesenta y cinco mil setecientos cuarenta y ocho millones seiscientos cincuenta y un mil cuatrocientos cincuenta y seis')}
  end
end

# frozen_string_literal: true

RSpec.describe CsvParser do
  let(:file) do
    Tempfile.new('csv').tap do |f|
      f << "Name,Country\n"
      f << 'John,Thailand'
      f.rewind
    end
  end

  describe 'call' do
    it 'returns an array of hash' do
      expect(described_class.(file)).to eq(
        [{ 'name' => 'John', 'country' => 'Thailand' }],
      )

      file.unlink
    end

    context 'with options' do
      it 'returns an array of hash' do
        options = {
          converters: [
            proc { |value, row|
              row.header == 'name' ? 'Doe' : value
            },
          ],
        }

        expect(described_class.(file, options)).to eq(
          [{ 'name' => 'Doe', 'country' => 'Thailand' }],
        )

        file.unlink
      end
    end
  end
end

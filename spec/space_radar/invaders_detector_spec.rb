# frozen_string_literal: true

module SpaceRadar
  RSpec.describe InvaderDetector do
    describe '#find_invaders' do
      context 'when there are no invaders' do
        it 'returns an empty hash' do
          detector = described_class.new([], [], [])
          expect(detector.find_invaders).to eq({})
        end
      end

      context 'when there are invaders present' do
        let(:invader1) { [%w[o o]] }
        let(:invader2) { [['o']] }
        let(:radar) { [['o', 'o', '-', 'o'], ['-', '-', '-', '-'], ['o', '-', 'o', '-']] }
        let(:radar_with_results) { [['X', 'X', '-', 'X'], ['-', '-', '-', '-'], ['X', '-', 'X', '-']] }
        let(:detector) { described_class.new([invader1, invader2], radar, radar.dup) }

        it 'returns a hash of invaders found in the radar with their counts' do
          expect(detector.find_invaders).to eq({ invader1 => 1, invader2 => 3 })
        end

        it 'highlights the location of the invaders in the results array' do
          detector.find_invaders
          expect(detector.instance_variable_get(:@radar_with_results)).to eq(radar_with_results)
        end

        context 'when the invader is larger than the radar' do
          let(:invader) { [['o', 'o', 'o'], ['-', '-', '-'], ['o', 'o', 'o']] }
          let(:radar) { [['-', '-', '-'], ['-', '-', '-']] }
          let(:radar_with_results) { [['-', '-', '-'], ['-', '-', '-']] }
          let(:detector) { described_class.new([invader], radar, radar.dup) }

          it 'does not count the invader' do
            expect(detector.find_invaders).to eq({ invader => 0 })
          end

          it 'does not highlight any locations on the results array' do
            detector.find_invaders
            expect(detector.instance_variable_get(:@radar_with_results)).to eq(radar_with_results)
          end
        end

        context 'when the invader is partially on the radar' do
          let(:invader) { [['o', 'o'], ['-', '-']] }
          let(:radar) { [['-', '-', '-', '-'], ['-', '-', 'o', 'o']] }
          let(:radar_with_results) { [['-', '-', '-', '-'], ['-', '-', 'o', 'o']] }
          let(:detector) { described_class.new([invader], radar, radar.dup) }

          it 'does not count the invader' do
            expect(detector.find_invaders).to eq({ invader => 0 })
          end

          it 'does not highlight the location of the invader in the results array' do
            detector.find_invaders
            expect(detector.instance_variable_get(:@radar_with_results)).to eq(radar_with_results)
          end
        end
      end
    end
  end
end

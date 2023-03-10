# frozen_string_literal: true

RSpec.describe SpaceRadar do
  it 'has a version number' do
    expect(SpaceRadar::VERSION).not_to be_nil
  end

  it 'has the answer' do
    scanner = SpaceRadar::Scanner.new('spec/fixtures/invaders/', 'spec/fixtures/radar.txt')

    invaders_found = scanner.scan_for_invaders

    expect(invaders_found.values).to eq([1, 0])
  end
end

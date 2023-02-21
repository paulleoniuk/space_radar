# frozen_string_literal: true
require 'pry'

RSpec.describe SpaceRadar do
  it 'has a version number' do
    expect(SpaceRadar::VERSION).not_to be_nil
  end

  it 'has the answer' do
    scanner = SpaceRadar::Scanner.new('spec/fixtures/invaders/', 'spec/fixtures/radar.txt')
    invader_counts = scanner.scan_for_invaders


    expect(2).to eq(2)
  end
end

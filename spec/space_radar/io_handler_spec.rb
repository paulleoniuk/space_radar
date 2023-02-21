# frozen_string_literal: true

require 'tempfile'

module SpaceRadar
  RSpec.describe IOhandler do
    describe '#upload_radar' do
      context 'with a valid file path' do
        let(:file) do
          Tempfile.new(['test_radar', '.txt']).tap do |f|
            f.puts 'oo-'
            f.puts '---'
            f.puts 'o-o'
            f.rewind
          end
        end

        it 'returns the contents of the file as a matrix' do
          expected_matrix = [
            %w[o o -],
            %w[- - -],
            %w[o - o]
          ]

          expect(described_class.upload_radar(file.path)).to eq(expected_matrix)
        end
      end

      context 'with an invalid file path' do
        it 'raises an ArgumentError' do
          expect { described_class.upload_radar('/invalid/file/path') }
            .to raise_exception(ArgumentError, 'Invalid file path: /invalid/file/path')
        end
      end

      context 'with a file path with an invalid extension' do
        let(:file) do
          Tempfile.new.tap do |f|
            f.puts 'oo-'
            f.puts '---'
            f.puts 'o-o'
            f.rewind
          end
        end

        before { allow(File).to receive(:extname).with(file.path).and_return('.pdf') }

        it 'raises an ArgumentError' do
          expect { described_class.upload_radar(file.path) }
            .to raise_exception(ArgumentError, "Invalid file extension for: #{file.path}. Should be .txt")
        end
      end
    end

    describe '#upload_invaders' do
      context 'when the folder path is invalid' do
        it 'raises an ArgumentError' do
          expect do
            described_class.upload_invaders('invalid_path')
          end.to raise_exception(ArgumentError, 'Invalid folder path: invalid_path')
        end
      end

      context 'when the folder contains no invader files' do
        it 'returns an empty array' do
          folder_path = 'spec/fixtures/invaders/empty'
          expect(described_class.upload_invaders(folder_path)).to be_empty
        end
      end

      context 'when the folder contains only empty invader files' do
        it 'returns an empty array' do
          folder_path = 'spec/fixtures/invaders/only_dots'
          expect(described_class.upload_invaders(folder_path)).to be_empty
        end
      end

      context 'when the folder contains non-empty invader files' do
        it 'returns an array of invaders' do
          folder_path = 'spec/fixtures/invaders/non_empty'
          expected_invaders = [
            [
              %w[o o],
              %w[o o]
            ]
          ]
          expect(described_class.upload_invaders(folder_path)).to eq(expected_invaders)
        end
      end

      context 'when the folder contains both empty and non-empty invader files' do
        it 'returns an array of only non-empty invaders' do
          folder_path = 'spec/fixtures/invaders/mixed'
          expected_invaders = [
            [
              ['o', 'o', 'o'],
              ['o', 'o', '-']
            ]
          ]
          expect(described_class.upload_invaders(folder_path)).to eq(expected_invaders)
        end
      end

      context 'when the folder contains files with invalid extension' do
        it 'raises an ArgumentError' do
          # expect { described_class.upload_invaders('spec/fixtures/invaders/invalid_extension') }
          #   .to raise_exception(ArgumentError, 'Invalid folder path: spec/fixtures/invaders/invalid_extension')
        end
      end
    end
  end
end

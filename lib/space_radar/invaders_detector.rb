# frozen_string_literal: true

# Invader Detection
module SpaceRadar
  class InvaderDetector
    def initialize(invaders, radar, radar_with_results)
      @invaders = invaders
      @radar = radar
      @radar_with_results = radar_with_results

    end

    def find_invaders
      invader_counts = Hash.new(0)

      @invaders.each do |invader|
        invader_height = invader.length
        invader_width = invader.first.length

        (0..@radar.length - invader_height).each do |i|
          (0..@radar[0].length - invader_width).each do |j|
            if invader?(i, j, invader)
              invader_counts[invader] += 1
              highlight_invader(i, j, invader)
            end
          end
        end
      end

      invader_counts
    end

    private

    def invader?(i_coordinate, j_coordinate, invader)
      invader.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          return false if col == 'o' && @radar[i_coordinate + row_index][j_coordinate + col_index] != 'o'
        end
      end
      true
    end

    def highlight_invader(i_coordinate, j_coordinate, invader)
      invader.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          @radar_with_results[i_coordinate + row_index][j_coordinate + col_index] = 'X' if col == 'o'
        end
      end
    end
  end
end

# frozen_string_literal: true

# Invader Detection
module SpaceRadar
  class InvaderDetector
    def initialize(invaders, radar, _radar_with_results)
      @invaders = invaders
      @radar = radar
      @radar_with_results = radar.dup

      # SpaceRadar::Display.show(@radar)
    end

    def find_invaders
      invader_counts = Hash.new(0)

      @invaders.each do |invader|
        invader_height = invader.length
        invader_width = invader.first.length

        (0..@radar.length - invader_height).each do |i|
          (0..@radar[0].length - invader_width).each do |j|
            if is_invader?(i, j, invader)
              invader_counts[invader] += 1
              highlight_invader(i, j, invader)
            end
          end
        end
      end

      invader_counts
    end

    def match_score(invader, i, j)
      invader_height = invader.length
      invader_width = invader.first.length
      match_score = 0

      invader.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          if col == 'o'
            if @radar[i + row_index][j + col_index] == 'o'
              match_score += 1
            else
              match_score -= 1
            end
          end
        end
      end

      match_score
    end

    private

    def is_invader?(i, j, invader)
      invader.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          return false if col == 'o' && @radar[i + row_index][j + col_index] != 'o'
        end
      end
      true
    end

    def highlight_invader(i, j, invader)
      invader.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
          @radar_with_results[i + row_index][j + col_index] = 'X' if col == 'o'
        end
      end
    end
  end
end

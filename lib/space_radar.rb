# frozen_string_literal: true

require 'space_radar/display'
require 'space_radar/invaders_detector'
require 'space_radar/uploaders'
require 'space_radar/version'

module SpaceRadar
  class Error < StandardError
    # Your code goes here...
  end

  class Scanner
    def initialize(invaders_guide_folder, radar_file)
      @invaders_guide_folder = invaders_guide_folder
      @radar_file = radar_file

      @invaders_guide = nil
      @radar = nil
      @radar_with_results = nil
    end

    def scan_for_invaders
      @radar = SpaceRadar::Uploaders.upload_radar(@radar_file)
      @radar_with_results = @radar.dup # Copy to highlight invaders later

      @invaders_guide = SpaceRadar::Uploaders.upload_invaders(@invaders_guide_folder)

      invaders_found = SpaceRadar::InvaderDetector.new(@invaders_guide, @radar, @radar_with_results).find_invaders

      SpaceRadar::Display.show(@radar_with_results)

      invaders_found
    end
  end
end

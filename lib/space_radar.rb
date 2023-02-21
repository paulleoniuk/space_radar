# frozen_string_literal: true

require 'space_radar/io_handler'
require 'space_radar/invaders_detector'
require 'space_radar/version'

module SpaceRadar
  class Error < StandardError; end

  class Scanner
    def initialize(invaders_guide_folder, radar_file)
      @invaders_guide_folder = invaders_guide_folder
      @radar_file = radar_file
    end

    def scan_for_invaders
      radar = SpaceRadar::IOhandler.upload_radar(@radar_file)
      invaders = SpaceRadar::IOhandler.upload_invaders(@invaders_guide_folder)
      radar_with_results = radar.dup # Copy to highlight invaders later

      invaders_found = SpaceRadar::InvaderDetector.new(invaders, radar, radar_with_results).find_invaders

      SpaceRadar::IOhandler.show(radar_with_results)

      invaders_found
    end
  end
end

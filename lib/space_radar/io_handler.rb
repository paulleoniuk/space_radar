# frozen_string_literal: true

module SpaceRadar
  module IOhandler
    module_function

    def show(matrix_array)
      return puts 'Nothing to show...' if matrix_array.nil? || matrix_array.empty?

      print_formatted_info(matrix_array.map { |row| row.join(' ') })
    end

    def print_formatted_info(text)
      puts '~~~~~~~~~~~~~~~~~'
      puts text
      puts '~~~~~~~~~~~~~~~~~'
    end

    def upload_radar(file)
      File.readlines(file, chomp: true).map(&:chars)
    end

    def upload_invaders(invaders_folder)
      invaders = []
      Dir.glob("#{invaders_folder}/*.txt").each do |invader_file|
        invaders << File.readlines(invader_file, chomp: true).map(&:chars)
      end
      invaders.reject! { |invader| invader.flatten.all? { |c| c == '.' } }

      invaders
    end
  end
end

# frozen_string_literal: true

module SpaceRadar
  module IOhandler
    module_function

    def show(matrix_array)
      print_formatted_info(matrix_array.map { |row| row.join(' ') })
    end

    def print_formatted_info(text)
      puts '~~~~~~~~~~~~~~~~~'
      puts text
      puts '~~~~~~~~~~~~~~~~~'
    end

    def upload_file(file_path)
      validate_file(file_path)
      validate_file_extension(file_path)

      File.readlines(file_path, chomp: true).map(&:chars)
    end

    def upload_invaders(folder_path)
      validate_folder(folder_path)

      invaders = []
      Dir.glob("#{folder_path}/*.txt").each do |invader_file|
        invaders << upload_file(invader_file)
      end
      invaders.reject! { |invader| invader.flatten.all? { |c| c == '.' } }

      invaders
    end

    def validate_file(file_path)
      raise ArgumentError, "Invalid file path: #{file_path}" unless File.exist?(file_path)
    end

    def validate_folder(folder_path)
      raise ArgumentError, "Invalid folder path: #{folder_path}" unless Dir.exist?(folder_path)
    end

    def validate_file_extension(file_path)
      return if File.extname(file_path) == '.txt'

      raise ArgumentError,
            "Invalid file extension for: #{file_path}. Should be .txt"
    end
  end
end

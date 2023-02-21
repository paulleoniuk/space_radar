# frozen_string_literal: true

module SpaceRadar
  module Display
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
  end
end

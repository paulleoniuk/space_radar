module SpaceRadar::Uploaders
  extend self

  def upload_radar(file)
    File.readlines(file, chomp: true).map(&:chars)
  end

  def upload_invaders(invaders_folder)

    invaders = []
    Dir.glob("#{invaders_folder}/*.txt").each do |invader_file|
      invaders << File.readlines(invader_file, chomp: true).map(&:chars)
    end
    # invaders.map { |invader| display_matrix(invader) }
    invaders.reject! { |invader| invader.flatten.all? { |c| c == '.' } }

    invaders
  end
end

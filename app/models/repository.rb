class Repository < ActiveRecord::Base
  has_many :publicationships
  has_many :pieces, through: :publicationships
  validates :name, :slug, presence: true

  scope :individual_pieces, -> {where(type: 'IndividualPieces')}
  scope :instrumental_book, -> {where(type: 'InstrumentalBook')}

  def editions(piece)
    public_path = Rails.public_path.to_s 
    directory = "#{public_path}/#{self.slug}/#{piece.slug}"
    basenames = Dir.glob("#{directory}/*.pdf").map do |pdf|
      File.basename(pdf.split('.')[0])
    end
    
    Dir.glob("#{directory}/*_mute.mid").empty? ? no_midi = true : no_midi = false

    my_editions = Array.new
    my_parts = parts("#{directory}/#{piece.slug}.ly") unless  no_midi
    basenames.each { |basename|
      unless no_midi
        music = Array.new
        my_parts.each  do |part|
          music.push(
            { order: part[:order],
              name: part[:name],
              mute: {
                midi: "#{basename}_#{part[:name]}_mute.mid",
                mp3: "#{basename}_#{part[:name]}_mute.mp3",
              },
              emphasized: {
                midi: "#{basename}_#{part[:name]}_emphasized.mid",
                mp3: "#{basename}_#{part[:name]}_emphasized.mp3",
              },
              solo: {
                midi: "#{basename}_#{part[:name]}_solo.mid",
                mp3: "#{basename}_#{part[:name]}_solo.mp3",
              },
            }
          ) 
        end
      end
      current_edition = { pdf: "#{basename}.pdf", midi: "#{basename}.mid", mp3: "#{basename}.mp3"}
      current_edition[:parts] = music unless no_midi
      my_editions.push(current_edition)
    }
    return my_editions 
  end
  def parts(lily_file)
    numbers = {'One'=> 1, 'Two'=> 2, 'Three'=>3, 'Four'=>4, 'Five'=>5, 'Six'=>6, 'Seven'=>7, 'Eight'=> 8, }
    my_parts = Array.new 
    File.open(lily_file, 'r') do |f|
      f.each_line { |line|
        if line.match(/scMusic\w+Name/)
          num = line.scan(/scMusic(\w+)Name/)[0][0]
          name = line.scan(/"([^"]*)"/)[0][0]
          
          my_parts.push ({name: name, order: numbers[num]})
        end 
      }
    end  
    return my_parts      
    
  end
end

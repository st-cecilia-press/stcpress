class Piece < ActiveRecord::Base
  has_many :manuscript_contents
  has_many :manuscripts, through: :manuscript_contents

  has_many :book_contents
  has_many :books, through: :book_contents

  has_many :song_voicings
  has_many :voicings, through: :song_voicings

  belongs_to :composer
  validates :title, :composer, :repo, :slug, presence: true  

  def editions
    public_path = Rails.public_path.to_s 
    Dir.chdir("#{public_path}/#{self.repo}/#{self.slug}")
    basenames = Array.new
    Dir.glob('*.pdf').each { |pdf|
      basenames.push(pdf.split('.')[0])
    }
    
    my_editions = Array.new
    my_parts = parts("#{public_path}/#{self.repo}/#{self.slug}/#{self.slug}.ly") unless Dir.glob('*_mute.mid').empty?
    basenames.each { |basename|
      unless Dir.glob('*_mute.mid').empty?
        music = Array.new
        my_parts.each  { |part|
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
        } 
      end
      current_edition = { pdf: "#{basename}.pdf", midi: "#{basename}.mid"}
      current_edition[:parts] = music unless Dir.glob('*_mute.mid').empty?
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

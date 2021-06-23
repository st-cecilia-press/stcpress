class SearchResultsPrototype
  attr_reader :results
  def initialize
    @pagination = Pagination.new(current_start: 0, total_results: 3)
    @results = [
      ComposerResultPrototype.new,
      PieceResultPrototype.new,
      BookResultPrototype.new
    ]
  end
  def numFound
    3
  end
  def start
    0
  end
  def q
    "Dowland"
  end
  def docs
    @results
  end
  def next_page
    @pagination.next_page
  end

  def prev_page
    @pagination.prev_page
  end

  def pages
    @pagination.pages
  end
  def each(&block)
    @results.each do |r|
      block.call(r)
    end
  end
  def facets
    [
      FacetPrototype.new('Category', [
        {name: 'Piece', total: 20},
        {name: 'Composer', total: 5},
        {name: 'Book', total: 5}
      ])
    ]
  end
  def active_filters
  end
end

class FacetPrototype
  attr_reader :list
  def initialize(name, list)
    @name = name   
    @list = list.map{|x| FacetItemPrototype.new(x[:name], x[:total])}
  end
  def to_s
    @name
  end
  def each(&block)
    @list.each do |l|
      block.call(l)
    end
  end
end
class FacetItemPrototype
  attr_reader :total
  def initialize(name, total)
    @name = name
    @total = total
  end
  def to_s
    @name
  end
  def url
    "#"
  end
end
class ResultPrototype
  def url
  end
  def snippet
  end
end
class ComposerResultPrototype < ResultPrototype
  def title
    "John Dowland"
  end
  def category
    "Composer"
  end
  def pieces
    "15"
  end
end

class PieceResultPrototype < ResultPrototype
  def category
    "Piece"
  end
  def title
    "Can She Excuse My Wrongs"
  end
  def composer
    "John Dowland"
  end
  def date
    "1601"
  end
  def tags
    ['madrigal', 'original language'].map{|x| TagPrototype.new(name) }
  end
end

class BookResultPrototype < ResultPrototype
  def category
    "Book"
  end
  def title
    "First Book of Madrigals"
  end
  def composer
    "John Dowland"
  end
  def date
    "1601"
  end
  def pieces
    "10"
  end
end
class TagPrototype
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
  def url
    "/tags/#{@name}"
  end
end

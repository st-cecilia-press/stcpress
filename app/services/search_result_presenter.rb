class SearchResultPresenter
  attr_reader :url
  def initialize(item, url)
    @item = item
    @url = url
  end
  def title
    @item.title
  end
  def snippet

  end
  def self.for(doc)
    case doc["model"]
    when "piece"
      PieceSearchResultPresenter.new(Piece.find_by(slug: doc["slug"]), doc["url"])
    when "composer"
      ComposerSearchResultPresenter.new(Composer.find_by(name: doc["title"]), doc["url"])
    when "manuscript"
      ManuscriptSearchResultPresenter.new(Manuscript.find_by(slug: doc["slug"]), doc["url"])
    when "book"
      BookSearchResultPresenter.new(Book.find_by(slug: doc["slug"]), doc["url"])
    end
  end
end

class PieceSearchResultPresenter < SearchResultPresenter
  def snippet
    array = []
    array.push("<b>by</b> #{@item.composer.name}")
    array.push("<b>Date</b>: #{ @item.date}")
    array.push("<b>Language</b>: #{ @item.languages.map{|l| l.name }.join(', ')}") if @item.languages.count > 0
    array.push("<b>In Books</b>: #{ @item.books.map{|b| b.title }.join(', ')}") if @item.books.count > 0
    array.push("<b>In Manuscripts</b>: #{ @item.manuscripts.map{|b| b.name }.join(', ')}") if @item.manuscripts.count > 0
    array.push("<b>Voicings:</b> #{ @item.voicings.map{|v| v.name }.join(', ') }")
    array.push("<b>Tags:</b> #{ @item.tags.map{|t| t.name }.join(', ') }")
    array.join('; ')
  end
end
class ComposerSearchResultPresenter < SearchResultPresenter
  def title
    @item.name
  end
  def snippet
    "<b>Pieces:</b> #{@item.pieces.map{|p| p.title}.join(', ')}"
  end
end
class BookSearchResultPresenter < SearchResultPresenter
  def snippet
    "<b>Pieces:</b> #{@item.pieces.map{|p| p.title}.join(', ')}"
  end
end
class ManuscriptSearchResultPresenter < SearchResultPresenter
  def title
    @item.name
  end
  def snippet
    "<b>Pieces:</b> #{@item.pieces.map{|p| p.title}.join(', ')}"
  end
  
end

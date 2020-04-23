class Pagination
  #assumes showing choice of 3 pages
  attr_reader :current_start, :total_results, :docs_per_page, :max_pages
  def initialize(current_start:, total_results:, docs_per_page: 10, max_pages: 5)
    @current_start = current_start
    @total_results = total_results
    @docs_per_page = docs_per_page
    @max_pages = max_pages
  end

  def next_page
    next_start = @current_start + @docs_per_page 
    if next_start > @total_results 
      PaginationPage.new(start: next_start, active: false)
    else
      PaginationPage.new(start: next_start, active: true)
    end
  end

  def prev_page
    if @current_start == 0
      PaginationPage.new(start:0, active: false)
    else
      PaginationPage.new(start:@current_start - @docs_per_page, active: true)
    end
  end
  def pages
    array = Array.new
    middle = ( @max_pages / 2 ) + 1
    if @current_start < (middle - 1) * @docs_per_page
      (1..@max_pages).each do |i|
        start = (i - 1)* @docs_per_page
        active = (@current_start != start)
        array.push(PaginationPage.new(start: start, active: active)) if start < total_results
      end
    else
      (1..@max_pages).each do |i|
        addend = (i - middle)* @docs_per_page
        start = @current_start + addend
        active = (@current_start != start)
        array.push(PaginationPage.new(start: start, active: active)) if start < total_results
      end
    end
    array
  end
end

class PaginationPage
    attr_reader :start, :active, :page_number
    def initialize(start:, active: true)
      @start = start
      @active = active 
      @page_number = (start / 10) + 1
    end
end

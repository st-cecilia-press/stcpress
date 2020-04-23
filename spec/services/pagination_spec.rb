require 'rails_helper'
describe Pagination, 'initialize' do
  before(:each) do
    @params = {current_start: 0, total_results: 55}
  end
  it "initializes with docs_per_page == 10 and max_pages == 5; current_start and total_results match what's given" do
    p = Pagination.new(@params)
    expect(p.docs_per_page).to eq(10)
    expect(p.total_results).to eq(@params[:total_results])
    expect(p.current_start).to eq(@params[:current_start])
  end
end
describe Pagination, 'first results page; more than 50 results' do
  before(:each) do
    @params = {current_start: 0, total_results: 55}
  end
  it "returns prev_page status inactive" do
    page = Pagination.new(@params).prev_page
    expect(page.active).to eq(false)
    expect(page.start).to eq(0)
    expect(page.page_number).to eq(1)
  end 
  it "returns next_page status active" do
    page = Pagination.new(@params).next_page
    expect(page.active).to be_truthy
    expect(page.start).to eq(10)
    expect(page.page_number).to eq(2)
  end 
  it "returns pages array with 5 elements" do
    pages = Pagination.new(@params).pages
    expect(pages.count).to eq(5)
  end
  it "returns first PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[0].start).to eq(0)
    expect(pages[0].active).to be_falsey
    expect(pages[0].page_number).to eq(1)
  end
  it "returns second PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[1].start).to eq(10)
    expect(pages[1].active).to be_truthy
    expect(pages[1].page_number).to eq(2)
  end
  it "returns third PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[2].start).to eq(20)
    expect(pages[2].active).to be_truthy
    expect(pages[2].page_number).to eq(3)
  end
  it "returns fourth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[3].start).to eq(30)
    expect(pages[3].active).to be_truthy
    expect(pages[3].page_number).to eq(4)
  end
  it "returns fifth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[4].start).to eq(40)
    expect(pages[4].active).to be_truthy
    expect(pages[4].page_number).to eq(5)
  end
end
describe Pagination, 'second page of results page; more than 50 results' do
  before(:each) do
    @params = {current_start: 10, total_results: 55}
  end
  it "returns prev_page status active" do
    page = Pagination.new(@params).prev_page
    expect(page.active).to be_truthy
    expect(page.start).to eq(0)
    expect(page.page_number).to eq(1)
  end 
  it "returns next_page status active" do
    page = Pagination.new(@params).next_page
    expect(page.active).to eq(true)
    expect(page.start).to eq(20)
    expect(page.page_number).to eq(3)
  end 
  it "returns pages array with 5 elements" do
    pages = Pagination.new(@params).pages
    expect(pages.count).to eq(5)
  end
  it "returns first PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[0].start).to eq(0)
    expect(pages[0].active).to be_truthy
    expect(pages[0].page_number).to eq(1)
  end
  it "returns second PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[1].start).to eq(10)
    expect(pages[1].active).to be_falsey
    expect(pages[1].page_number).to eq(2)
  end
  it "returns third PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[2].start).to eq(20)
    expect(pages[2].active).to be_truthy
    expect(pages[2].page_number).to eq(3)
  end
  it "returns fourth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[3].start).to eq(30)
    expect(pages[3].active).to be_truthy
    expect(pages[3].page_number).to eq(4)
  end
  it "returns fifth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[4].start).to eq(40)
    expect(pages[4].active).to be_truthy
    expect(pages[4].page_number).to eq(5)
  end
end
describe Pagination, 'third page of results page; more than 50 results' do
  before(:each) do
    @params = {current_start: 20, total_results: 55}
  end
  it "returns prev_page status active" do
    page = Pagination.new(@params).prev_page
    expect(page.active).to be_truthy
    expect(page.start).to eq(10)
    expect(page.page_number).to eq(2)
  end 
  it "returns next_page status active" do
    page = Pagination.new(@params).next_page
    expect(page.active).to be_truthy
    expect(page.start).to eq(30)
    expect(page.page_number).to eq(4)
  end 
  it "returns pages array with 5 elements" do
    pages = Pagination.new(@params).pages
    expect(pages.count).to eq(5)
  end
  it "returns first PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[0].start).to eq(0)
    expect(pages[0].active).to be_truthy
    expect(pages[0].page_number).to eq(1)
  end
  it "returns second PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[1].start).to eq(10)
    expect(pages[1].active).to be_truthy
    expect(pages[1].page_number).to eq(2)
  end
  it "returns third PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[2].start).to eq(20)
    expect(pages[2].active).to be_falsey
    expect(pages[2].page_number).to eq(3)
  end
  it "returns fourth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[3].start).to eq(30)
    expect(pages[3].active).to be_truthy
    expect(pages[3].page_number).to eq(4)
  end
  it "returns fifth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[4].start).to eq(40)
    expect(pages[4].active).to be_truthy
    expect(pages[4].page_number).to eq(5)
  end
end
describe Pagination, 'fourth page of results page; 44 results' do
  before(:each) do
    @params = {current_start: 30, total_results: 44}
  end
  it "returns prev_page status active" do
    page = Pagination.new(@params).prev_page
    expect(page.active).to be_truthy
    expect(page.start).to eq(20)
    expect(page.page_number).to eq(3)
  end 
  it "returns next_page status active" do
    page = Pagination.new(@params).next_page
    expect(page.active).to be_truthy
    expect(page.start).to eq(40)
    expect(page.page_number).to eq(5)
  end 
  it "returns pages array with 4 elements" do
    pages = Pagination.new(@params).pages
    expect(pages.count).to eq(4)
  end
  it "returns first PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[0].start).to eq(10)
    expect(pages[0].active).to be_truthy
    expect(pages[0].page_number).to eq(2)
  end
  it "returns second PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[1].start).to eq(20)
    expect(pages[1].active).to be_truthy
    expect(pages[1].page_number).to eq(3)
  end
  it "returns third PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[2].start).to eq(30)
    expect(pages[2].active).to be_falsey
    expect(pages[2].page_number).to eq(4)
  end
  it "returns fourth PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[3].start).to eq(40)
    expect(pages[3].active).to be_truthy
    expect(pages[3].page_number).to eq(5)
  end
end
describe Pagination, 'first results page; 9 results' do
  before(:each) do
    @params = {current_start: 0, total_results: 9}
  end
  it "returns prev_page status inactive" do
    page = Pagination.new(@params).prev_page
    expect(page.active).to eq(false)
    expect(page.start).to eq(0)
    expect(page.page_number).to eq(1)
  end 
  it "returns next_page status inactive" do
    page = Pagination.new(@params).next_page
    expect(page.active).to be_falsey
    expect(page.start).to eq(10)
    expect(page.page_number).to eq(2)
  end 
  it "returns pages array with 1 element" do
    pages = Pagination.new(@params).pages
    expect(pages.count).to eq(1)
  end
  it "returns first PaginationPage" do
    pages = Pagination.new(@params).pages
    expect(pages[0].start).to eq(0)
    expect(pages[0].active).to be_falsey
    expect(pages[0].page_number).to eq(1)
  end
end

require 'rails_helper'

describe "books API endpoints" do
  before :each do
    @books = create_list(:book, 4)
  end

  it "can return json for all books" do
    get '/api/v1/books'

    expect(response).to be_success

    books = JSON.parse(response.body, symbolize_names: true)
    expect(books.count).to eq(4)
    expect(books.first[:id]).to eq(@books.first.id)
  end

  it "can return JSON for one book" do
    get "/api/v1/books/#{@books.first.id}"

    expect(response).to be_success

    book = JSON.parse(response.body, symbolize_names: true)
    expect(book[:id]).to eq(@books.first.id)
  end

  it "can create a book" do
    book_params = {title: "Goosebumps", description: "A horror novel series for children"}

    post "/api/v1/books", params:{book: book_params}

    book = Book.last
    expect(response).to be_success
    expect(book.name).to eq(book_params[:name])
  end
end

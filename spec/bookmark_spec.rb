require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager2_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.twitter.com')
    expect(bookmarks).to include('http://www.google.com')
  end
  
describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.example.org')

    expect(Bookmark.all).to include 'http://www.example.org'
  end
end

end

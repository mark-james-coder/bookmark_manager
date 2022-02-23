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
end

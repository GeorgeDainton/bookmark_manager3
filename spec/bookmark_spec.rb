require 'bookmark'


describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")



      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
      Bookmark.add("http://www.wikipedia.org")
      connection = PG.connect(dbname: 'bookmark_manager_test') 

      result = connection.exec('SELECT * FROM bookmarks;')
      bookmarks = result.map{|bookmark| bookmark['url']}

      expect(bookmarks).to include("http://www.wikipedia.org")
    end
  end 
end


# Test drive a refactor of the code to use a Model, that returns the list of bookmarks.
# You'll probably want to create a Bookmark model that responds to the class method .all with a hard-coded array of Bookmark instances.

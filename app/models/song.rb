class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  attr_reader :genre_id

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        note = Note.create(content: note)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end
end

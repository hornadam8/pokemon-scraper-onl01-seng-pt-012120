class Pokemon
  attr_accessor :name,:type
  attr_reader :id,:db
  
  def initialize(pokehash)
    #binding.pry
    @id = pokehash[:id]
    @name = pokehash[:name]
    @type = pokehash[:type]
    @db = pokehash[:db]
  end
  
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id,db)
    np = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    pokehash = {:id => np[0],:name => np[1],:type => np[2],:db => db}
    self.new(pokehash)
  end
  
end

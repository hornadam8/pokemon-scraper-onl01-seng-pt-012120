class Pokemon
  attr_accessor :name,:type
  attr_reader :id,:db
  
  def initialize(pokehash)
    @id = pokehash[:id]
    @name = pokehash[:name]
    @type = pokehash[:type]
    @db = pokehash[:db]
  end
  
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id,db)
    np = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])[0]
    binding.pry 
    self.new(np)
  end
  
end

class Stylist
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    stylists = []
    results = DB.exec("SELECT * FROM stylists;")
    results.each do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  def save
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i

  end

  def ==(other_stylist)
    same_name = @name == other_stylist.name
    same_id = @id == other_stylist.id
    same_name && same_id
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    name = result.first.fetch('name')
    id = result.first.fetch('id').to_i
    Stylist.new({:name => name, :id => id})
  end

  def clients
    clients = []
    results = DB.exec("SELECT * FROM clients WHERE stylist_id =#{@id};")
    results.each do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i
      stylist_id = result.fetch('stylist_id').to_i
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

end

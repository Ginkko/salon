class Client
  attr_reader :name, :id, :stylist_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  def self.all
    clients = []
    results = DB.exec("SELECT * FROM clients;")
    results.each do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i
      stylist_id = result['stylist_id']
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  def save
    if @stylist_id == nil
      result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    else
      result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    end
    @id = result.first.fetch('id').to_i
  end

  def ==(other_client)
    same_name = @name == other_client.name
    same_id = @id == other_client.id
    same_stylist_id = @stylist_id == other_client.stylist_id
    same_name && same_id && same_stylist_id
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    name = result.first.fetch('name')
    id = result.first.fetch('id').to_i
    stylist_id = result.first.fetch('stylist_id')
    Client.new({:name => name, :id => id, :stylist_id => stylist_id})
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id};")
  end
end

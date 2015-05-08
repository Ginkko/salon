class Client
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    clients = []
    results = DB.exec("SELECT * FROM clients;")
    results.each do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(other_client)
    same_name = @name == other_client.name
    same_id = @id == other_client.id
    same_name && same_id
  end

end

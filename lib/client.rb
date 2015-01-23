class Client

  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      all_clients_push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    all_clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{name}', #{stylist_id})")
  end

  define_method(:==) do |another_client|
    self.name().eql?(another_client.name()).&(self.stylist_id().eql?(another_client.stylist_id()))
  end
end

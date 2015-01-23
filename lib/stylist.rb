class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      all_stylists.push(Stylist.new({:name => name, :id => id}))
    end
    all_stylists
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    stylist_clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO stylists (name) VALUES ('#{name}')")
  end

  define_method(:==) do |another_stylist|
    self.name().eql?(another_stylist.name()).&(self.id().eql?(another_stylist.id()))
  end


end

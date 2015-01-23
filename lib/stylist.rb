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

end

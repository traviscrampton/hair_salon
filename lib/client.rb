class Client

  attr_reader(:title, :stylist_id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      title = client.fetch("title")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:title => title, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (title, stylist_id) VALUES ('#{@title}', #{@stylist_id});")
  end

  define_method(:==) do |another_client|
    self.title().==(another_client.title()).&(self.stylist_id().==(another_client.stylist_id()))
  end
end

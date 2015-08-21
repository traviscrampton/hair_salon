require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("tells you its name") do
      stylist = Stylist.new({:name => "Sharon", :id => nil})
      expect(stylist.name()).to(eq("Sharon"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new ({:name => "Sharon", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Sharon", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Sharon", :id => nil})
      stylist2 = Stylist.new({:name => "Sharon", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by thier ID") do
      test_stylist = Stylist.new({:name => "Sharon", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new(:name => "Debbie", :id => nil)
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Sharon", :id => nil})
      test_stylist.save()
      test_client = Client.new({:title => "Jeff", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:title => "Donald", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#update") do
    it("lets you update a stylist from the database") do
      stylist = Stylist.new({:name => "Sharon", :id => nil})
      stylist.save()
      stylist.update({:name => "Katrina"})
      expect(stylist.name()).to(eq("Katrina"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Sharon", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Fabio", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  it("deletes a stylist's clients from the database") do
    stylist = Stylist.new({:name => "Sharon", :id => nil})
    stylist.save()
    client = Client.new({:title => "Jeff", :stylist_id => stylist.id()})
    client.save()
    client2 = Client.new({:title => "Donald", :stylist_id => stylist.id()})
    client2.save()
    stylist.delete()
    expect(Client.all()).to(eq([]))
  end
end

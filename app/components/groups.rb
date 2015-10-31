class Groups < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Group"
  end
end

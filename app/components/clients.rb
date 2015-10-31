class Clients < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Client"
  end
end

class Routes < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Route"
  end
end

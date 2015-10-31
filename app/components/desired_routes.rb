class DesiredRoutes < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "DesiredRoute"
  end
end

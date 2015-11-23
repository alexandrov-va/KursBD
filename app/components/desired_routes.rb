class DesiredRoutes < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "DesiredRoute"
    c.columns = [
    :client__lastname,
        :route__country]
  end
end

class DesiredRoutes < Netzke::Basepack::Grid

  def configure(c)
    super
    c.model = "DesiredRoute"
    c.columns = [
        {name: :client__lastname, flex: 1},
        {name: :route__country, flex: 1}]
    c.enable_pagination = false
    c.bbar = [:add, :edit, :del, :search, :apply]
    c.height = 620
  end
end

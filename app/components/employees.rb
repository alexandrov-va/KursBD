class Employees < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Employee"
    c.enable_pagination = false
  end
end

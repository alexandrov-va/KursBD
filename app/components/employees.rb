class Employees < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Employee"
    c.enable_pagination = false
    c.columns = [
      {name: :fullname, flex: 3, getter: ->(r){[r.lastname, r.firstname, r.patronymic].join(' ')},
      setter: ->(r,v){r.lastname, r.firstname, r.patronymic = v.split(" ")}},
      { name: :vacant, flex: 1 }
    ]
  end
end

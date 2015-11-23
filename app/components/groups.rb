class Groups < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Group"
    c.columns=[
      :travel_date,
      :employee__lastname,
      :route__country
    ]
  end
end

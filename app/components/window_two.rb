class WindowTwo < Netzke::Basepack::Window
  def configure(c)
    super
    c.persistence = true
    c.title = "Window nesting a grid"
    c.width = 800
    c.height = 400
    c.items = [:groups]
  end

  component :groups do |c|
    c.scope = ->(rel){ rel.where("NOW() < travel_date") }
  end
end

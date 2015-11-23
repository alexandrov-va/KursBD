class WindowOne < Netzke::Basepack::Window
  def configure(c)
    super
    c.persistence = true
    c.title = "Window nesting a grid"
    c.width = 800
    c.height = 400
    c.items = [:clients]
  end

  component :clients do |c|
    c.scope = {group_id: 3}
  end
end

class Clients < Netzke::Basepack::Grid

  js_configure do |c|
    c.onClearGroups = <<-JS
      function()
      {
        this.clearGroupsQuery({});
      }
    JS
  end

  def configure(c)
    super
    c.model = "Client"
    c.enable_pagination = false
    c.bbar = [:add, :del, :edit, :apply, :search, :clear_groups]
  end

  action :clear_groups

  endpoint :clear_groups_query do |params, this|
    Client.find_each do |client|
      Client.update(client.id, group: nil)
    end
  end
end

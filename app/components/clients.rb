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
    c.columns = [
      {name: :fullname, getter: ->(r){[r.lastname, r.firstname, r.patronymic].join(' ')},
      setter: ->(r,v){r.lastname, r.firstname, r.patronymic = v.split(" ")}, flex: 2},
      {name: :passport, flex: 2}, {name: :address, flex: 2},
      {name: :phonenumber, flex: 2}, {name: :group_id, flex: 1}
    ]
  end

  action :clear_groups

  endpoint :clear_groups_query do |params, this|
    Client.find_each do |client|
      Client.update(client.id, group: nil)
    end
  end
end

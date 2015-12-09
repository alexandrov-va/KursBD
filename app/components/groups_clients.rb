class GroupsClients < Netzke::Basepack::Form

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();

        this.netzkeGetComponent('groups').on('rowclick', function(grid, record)
        {
          this.serverSetGroup({group_id: record.getId()});

          this.netzkeGetComponent('clients').getStore().load();
        }, this);
      }
    JS
  end

  def configure(c)
    super
      c.items = [:groups, :clients]
      c.layout = {type: :hbox, align: :stretch}
  end

  component :groups do |c|
    c.flex = 1
  end

  component :clients do |c|
    c.flex = 1
    c.scope = {group_id: component_session[:current_group_id]}
  end

  endpoint :server_set_group do |params, this|
    p "NONONONO"
    component_session[:current_group_id] = params[:group_id]
  end
end

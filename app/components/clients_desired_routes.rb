class ClientsDesiredRoutes < Netzke::Basepack::Form

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();

        this.netzkeGetComponent('clients').on('rowclick', function(grid, record)
        {
          this.serverSetClient({client_id: record.getId()});

          this.netzkeGetComponent('desired_routes').getStore().load();
        }, this);
      }
    JS
  end

  def configure(c)
    super
      c.items = [:clients, :desired_routes]
      c.layout = {type: :hbox, align: :stretch}
  end

  component :clients do |c|
    c.flex = 1
  end

  component :desired_routes do |c|
    c.flex = 1
    c.scope = {client_id: component_session[:current_client_id]}
  end

  endpoint :server_set_client do |params, this|
    component_session[:current_client_id] = params[:client_id]
  end
end

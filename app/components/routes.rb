class Routes < Netzke::Basepack::Grid

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();

        this.on('rowclick', function(grid, record)
        {
          this.selectRoute({route_id: record.getId()});
        }, this);
      }
    JS

    c.onFormGroup = <<-JS
    function()
    {
      this.formGroupQuery({});
    }
    JS

    c.showMessage = <<-JS
    function(msg)
    {
      Ext.Msg.alert("Info", msg);
    }
    JS
  end

  def configure(c)
    super
    c.model = "Route"
    c.enable_pagination = false
    c.bbar = [:add, :del, :edit, :apply, :form_group, :search]
    c.columns = [
      {name: :country, flex: 1}, {name: :duration, flex: 1}, {name: :cost, flex: 1}
    ]
  end

  action :form_group

  endpoint :select_route do |params, this|
    session[:selected_route] = params[:route_id]
  end

  endpoint :form_group_query do |params, this|
    if session[:selected_route] != nil
      group = Group.create(route_id: session[:selected_route])
      this.show_message("Successfully created group with route country: #{Route.find(session[:selected_route]).country}")
    end
  end
end

class Groups < Netzke::Basepack::Grid

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();

        this.on('rowclick', function(grid, record)
        {
          this.selectGroup({group_id: record.getId()});
        }, this);
      }
    JS

    c.onFillGroup = <<-JS
    function()
    {
      this.fillGroupQuery({});
    }
    JS

    c.showMessage = <<-JS
    function(msg)
    {
      Ext.Msg.alert("Info", msg);
    }
    JS

    c.onApply = <<-JS
    function()
    {
      this.getStore().sync();
      this.updateEmployees({});
      var cols = [];
      var store = this.getStore();
      for(var i = 0; i < this.columns.length; i++)
        cols[i] = this.columns[i].cloneConfig();
      this.reconfigure(this.getStore(), cols);
    }
    JS

  end

  def configure(c)
    super
    c.model = "Group"
    c.columns=[
      {name: :travel_date, flex: 1},
      { name: :employee__lastname, flex: 1, scope: ->(r){r.where("vacant = TRUE")}},
      {name: :route__country, flex: 1}
    ]
    c.enable_pagination = false
    c.bbar = [:add, :edit, :del, :search, :apply, :fill_group]
  end

  action :fill_group

  endpoint :select_group do |params, this|
    session[:selected_group] = params[:group_id]
  end

  endpoint :fill_group_query do |params, this|
    route = Group.find(session[:selected_group]).route
    client_route_desired_ids = DesiredRoute.where(route: route).pluck(:client_id)
    clients_wo_groups_ids = Client.where(group: nil).pluck(:id)
    client_ids = client_route_desired_ids & clients_wo_groups_ids
    same_group_array = Array.new(client_ids.count, {group_id: session[:selected_group]})
    Client.update(client_ids, same_group_array)
    this.show_message("#{client_ids.count} clients added in group №#{session[:selected_group]}")
  end

  endpoint :update_employees do |params, this|
    emp_ids = Employee.select(:id).pluck(:id)
    emp_vac_true = Array.new(emp_ids.count, {vacant: true})
    Employee.update(emp_ids, emp_vac_true)
    Group.find_each do |group|
      Employee.update(group.employee_id, vacant: false)
    end
  end
end

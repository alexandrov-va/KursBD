class Netzke::Base
  action :query_one
end

class MainPanel < Netzke::Basepack::TabPanel

  js_configure do |c|
    c.on_query_one = <<-JS
      function()
      {
        this.doSmth({}, function(result){
          console.log(result);
          Ext.Msg.show({
          title: "Details",
          width: 1000,
          height: 500,
          msg: result
        });});
      }
      JS
  end

  component :clients do |c|
    c.klass = Clients
  end

  component :groups do |c|
    c.klass = Groups
  end

  component :desired_routes do |c|
    c.klass = DesiredRoutes
  end

  component :employees do |c|
    c.klass = Employees
  end

  component :routes do |c|
    c.klass = Routes
  end

  def configure(c)
    super
    c.items = [:clients, :groups, :desired_routes, :employees, :routes]
    c.docked_items = [{
      xtype: :toolbar,
      dock: :left,
      items: [:query_one]
    }]
  end

  endpoint :do_smth do |params, this|
    result = Client.where(group_id: 3).to_a.inspect
    p result
    result.gsub!('<', '')
    result.gsub!('>', '')
    result.gsub!('[', '<b>')
    result.gsub!(',', '<b>')
    result.gsub!(']', '</b>')
    result.gsub!(':', '</b>')
    result.gsub!('#', '<br>')
    this.netzke_set_result(result)
  end
end

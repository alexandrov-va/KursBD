class MainPanel < Netzke::Basepack::Viewport

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();

        this.navigation = this.down('panel[itemId="navigation"]');
        this.navigation.on('select', function(m, r) {
          this.netzkeLoadComponent(r.raw.cmp, {container: this.mainPanel, callback: function(cmp) {
            if (cmp.isFloating()) { cmp.show(); }
          }, scope: this});
        }, this);
      }
    JS
  end

  def configure(c)
    c.items = [
      {
        xtype: :treepanel,
        item_id: :navigation,
        flex: 1,
        root: menu,
        title: "TREEMENU"
      },
      :main_tab
    ]
    c.layout = {:type => :hbox}
  end

  component :main_tab do |c|
    c.klass = MainTab
    c.flex = 5
  end

  component :window_one do |c|
    c.klass = WindowOne
  end

  def leaf(text, component, icon = nil)
    { text: text,
      icon: icon && uri_to_icon(icon),
      cmp: component,
      leaf: true
    }
  end

  def menu
    {
      :text => "Windows",
      :expanded => true,
      :children => [leaf("Number One", :window_one)]
    }
  end
end

class MainTab < Netzke::Basepack::TabPanel

  def configure(c)
    super
    c.items = [:clients_desired_routes, :groups_clients, :routes, :employees]
  end

  component :clients_desired_routes do |c|
    c.klass = ClientsDesiredRoutes
    c.title = "Clients and DesiredRoutes"
  end

  component :groups_clients do |c|
    c.klass = GroupsClients
    c.title = "Groups and Clients"
  end

  component :routes do |c|
    c.klass = Routes
  end

  component :employees do |c|
    c.klass = Employees
  end
end

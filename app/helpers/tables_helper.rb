module TablesHelper
  def get_tables
    @tables = ActiveRecord::Base.connection.tables
    @tables = @tables.reject{|i| i == "schema_migrations"}
  end
end

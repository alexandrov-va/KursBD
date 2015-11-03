class TablesController < ApplicationController

  include TablesHelper

  def index
    get_tables
  end

  def show
    get_tables
    @table_name = params[:id]
  end
end

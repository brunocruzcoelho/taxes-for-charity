class Admin::AssociationsController < ApplicationController
  require 'csv'

  def index
  end

  def import
    if file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        Association.create(nif: row[0], name: row[1], city: row[2])
      end

      redirect_to admin_url, notice: "Associations CSV imported."
    else
      redirect_to admin_url, notice: "Please choose a file."
    end
  end
end

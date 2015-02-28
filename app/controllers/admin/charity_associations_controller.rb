class Admin::CharityAssociationsController < ApplicationController
  require 'csv'
  before_action :validate_admin_key

  def index
  end

  def import
    CharityAssociation.delete_all if params[:delete_charity_asociations_before_import]

    if file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        name = row[1].split(' ').map { |word| word.capitalize }
        name = name.join ' '

        CharityAssociation.create(nif: row[0], name: name, city: row[2])
      end

      redirect_to admin_url, notice: "Charity Associations CSV imported."
    else
      redirect_to admin_url, notice: "Please choose a file."
    end
  end

  private

  def validate_admin_key
    session[:admin_key] ||= params[:admin_key]

    unless Rails.application.config.admin_key.eql?(session[:admin_key])
      session[:admin_key] = nil
      flash[:error] = "You must have an admin key to perform admin actions"
    end
  end
end

class Admin::CharityAssociationsUploaderController < ApplicationController
  require 'csv'
  before_action :validate_admin_key

  def index
  end

  def import
    redirect_to admin_uploader_url, notice: 'Please choose the type of data you are uploading (IPSS or CAE).' and return if params[:info_type].blank?

    if params[:info_type].eql?('charity_associations')
      import_charity_associations_file
    elsif params[:info_type].eql?('activity_codes')
      import_activity_codes_file
    end
  end

  private

  def validate_admin_key
    session[:admin_key] ||= params[:admin_key]

    unless Rails.application.config.admin_key.eql?(session[:admin_key])
      session[:admin_key] = nil
      flash[:error] = 'You must have an admin key to perform admin actions'
    end
  end

  def import_charity_associations_file
    CharityAssociation.delete_all if params[:delete_before_import]

    if file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        name = row[1].split(' ').map { |word| word.capitalize }
        name = name.join ' '

        CharityAssociation.create(nif: row[0], name: name, city: row[2])
      end

      redirect_to admin_uploader_url, notice: 'Charity Associations CSV imported.'
    else
      redirect_to admin_uploader_url, notice: 'Please choose a file.'
    end
  end

  def import_activity_codes_file
    ActivityCode.delete_all if params[:delete_before_import]

    if file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        ActivityCode.create(code: row[1], name: row[2])
      end

      redirect_to admin_uploader_url, notice: 'Activity Codes CSV imported.'
    else
      redirect_to admin_uploader_url, notice: 'Please choose a file.'
    end
  end
end

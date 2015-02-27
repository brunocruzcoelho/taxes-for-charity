class AssociationsController < ApplicationController
  def index
    @associations = Association.all
  end

  def search
    redirect_to action: :index and return if params[:search].blank?

    search_field = params[:search_field].blank? ? 'name' : params[:search_field]

    @associations = Association.where("lower(#{search_field}) LIKE ?", "%#{(params[:search]).downcase}%")
    render :index
  end
end

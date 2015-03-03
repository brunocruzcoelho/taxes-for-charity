class CharityAssociationsController < ApplicationController
  def index
    @charity_associations = CharityAssociation.all
    @activity_codes = ActivityCode.all
  end

  def search
    redirect_to action: :index and return if params[:search].blank?

    search_field = params[:search_field].blank? ? 'name' : params[:search_field]

    @charity_associations = CharityAssociation.where("lower(#{search_field}) LIKE ?", "%#{(params[:search]).downcase}%")
    render :index
  end
end

class CharityAssociationsController < ApplicationController
  def search
    redirect_to root_url, notice: 'Introduza termos de pesquisa, por favor.' and return if params[:search_term].blank?

    chain = default_chain(params[:search_term])
    chain = chain.where(city: params[:city]) unless params[:city].blank?
    chain = chain.where(activity_code_id: params[:activity_code]) unless params[:activity_code].blank?

    @charity_associations = chain
  end

  private

  def default_chain(search_term)
    CharityAssociation.where("lower(name) LIKE ?", "%#{(search_term).downcase}%")
  end
end

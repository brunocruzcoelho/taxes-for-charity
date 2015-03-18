class CharityAssociationsController < ApplicationController
  def search
    if params[:city].blank? && params[:activity_code].blank?
      return render(partial: 'search_results', locals: { message: 'Introduza termos de pesquisa, por favor.' })
    end

    chain = default_chain(params[:search_term])
    chain = chain.where(city: params[:city]) unless params[:city].blank?
    chain = chain.where(activity_code_id: params[:activity_code]) unless params[:activity_code].blank?

    @charity_associations = chain

    if @charity_associations.any?
      render partial: 'search_results'
    else
      render partial: 'search_results', locals: { message: 'Não foram encontradas instituições. Tente redefinir os termos de pesquisa, por favor.' }
    end
  end

  private

  def default_chain(search_term)
    CharityAssociation.where("lower(name) LIKE ?", "%#{(search_term).downcase}%")
  end
end

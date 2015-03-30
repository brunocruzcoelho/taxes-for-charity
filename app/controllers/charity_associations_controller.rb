class CharityAssociationsController < ApplicationController
  def search
    if (params[:city].blank? && params[:category_id].blank? && params[:search_term].blank?)
      return render(partial: 'search_results', locals: { message: 'Introduza termos de pesquisa, por favor.' })
    end

    chain = CharityAssociation
    chain = chain.where("lower(name) LIKE ?", "%#{(params[:search_term]).downcase}%") unless params[:search_term].blank?
    chain = chain.where(city: params[:city]) unless params[:city].blank?

    unless params[:category_id].blank?
      chain = chain.joins(:activity_code).where('activity_codes.category_id = ?', params[:category_id])
    end

    @charity_associations = chain

    if @charity_associations.any?
      render partial: 'search_results'
    else
      render partial: 'search_results', locals: { message: 'Não foram encontradas instituições. Tente redefinir os termos de pesquisa, por favor.' }
    end
  end
end

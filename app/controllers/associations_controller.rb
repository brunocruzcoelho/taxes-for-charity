class AssociationsController < ApplicationController
  def index
    @associations = Association.all
  end
end

class PagesController < ApplicationController

  def home
    @agencies = Agency.all
  end


end

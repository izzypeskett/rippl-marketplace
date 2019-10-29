class PagesController < ApplicationController

  def home
    @agencies = Agency.all
  end

  def agency
  end


end

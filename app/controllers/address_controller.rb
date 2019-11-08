class AddressController < ApplicationController
 
  def new
    @address = Address.new
  end

  def address
    [number, street, city, state, country].compact.join(', ')
  end

  def create
    @address = Address.create (address_params)
    @address.save 
  end
end
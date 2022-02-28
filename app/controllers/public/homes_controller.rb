class Public::HomesController < ApplicationController
  def top
    @items = Item.all
  end
  
  def adout
  end
end

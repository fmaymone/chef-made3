require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  fixtures :menus
  
  def test_menus

      @menu = Menu.new(
         :title => menus(:menu_incrivel_test1).title, 
         :description =>  menus(:menu_incrivel_test1).description,
         :user => User.last)
      
      
      assert @menu.save, @menu.errors.inspect

      @menu_copia = Menu.find(@menu.id)
      
      assert_equal @menu.title, @menu_copia.title
    end

end

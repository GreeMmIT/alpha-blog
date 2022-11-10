require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end 


test "should show categories listing" do
  get '/categories' #testa la route di richiesta catagorie
  assert_select "a[href=?]", category_path(@category), test: @category.name #cerca il collegament eo per la cvreazione delle catagorie
  assert_select "a[href=?]", category_path(@category2), test: @category2.name

end



end

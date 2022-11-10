require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "admin", email: "a@a.com", password: "010101", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create catagory" do
    get "/categories/new" #testo la routes
    assert_response :success 
    assert_difference 'Category.count', 1 do 
      post categories_path, params: {category: { name: "Sports"} }
      assert_response :redirect
    end
    follow_redirect! #seguiamo il redirect e controlliamo che sia effettivamente avvenuto
    assert_response :success 
    assert_match "Sports", response.body #qua cerca la parola nell'html Sports per vedere se compare almeno una volta sinigifica che il redirect è andato a buon fine
  end

  test "get new category form and reject cataegory submission" do
    get "/categories/new" #testo la routes
    assert_response :success 
    assert_no_difference 'Category.count' do 
      post categories_path, params: {category: { name: " "} }      
    end
    assert_match "errori", response.body #qua cerca la parola nell'html Sports per vedere se compare almeno una volta sinigifica che il redirect è andato a buon fine
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end

class Admin::CategoriesController < ApplicationController
  before_action :authorize
  # GET /admin/categories or /admin/categories.json
  def index
    @categories = Category.all
  end
  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # POST /admin/categories or /admin/categories.json
  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
   
  end

  
  private

    # Only allow a list of trusted parameters through.
    def categories_params
      params.require(:category).permit(
        :name,
      )
    end
end

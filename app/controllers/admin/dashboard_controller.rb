class Admin::DashboardController < ApplicationController
  before_filter :authorize
  def show
    @products = Product.all
    @categories = Category.all
  end
end

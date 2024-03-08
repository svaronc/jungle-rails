class Admin::DashboardController < ApplicationController
  before_action :authorize
  def show
    @products = Product.all
    @categories = Category.all
  end
end

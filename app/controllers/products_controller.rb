class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(name: params[:name], price: params[:price], description: params[:description])
    redirect_to '/products'
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end
end

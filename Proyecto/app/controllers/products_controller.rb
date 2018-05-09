class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  add_breadcrumb "Products", :products_path

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    @products = Product.as(:p).where("p.expired_at > #{Date.today.strftime('%s')}")
  end

  # GET /products/1
  # GET /products/1.json
  def show
       add_breadcrumb "#{@product.recipe.name}", :product_path
  end

  # GET /products/new
  def new
      add_breadcrumb "New", :new_product_path
      @product = Product.new
      @recipes = Recipe.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: products_url }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_recipe_materials
    @product = Product.find(params[:id])
    @materials = @product.recipe.recipe_materials
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:id, :expired_at, :recipe_id)
    end
end

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Recipes", :recipes_path

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
      add_breadcrumb "#{@recipe.name}", :recipe_path
  end

  # GET /recipes/new
  def new
      add_breadcrumb "New", :new_recipe_path
      @raws = Raw.all
      @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
      add_breadcrumb "#{@recipe.name}", :edit_recipe_path
      @raws = Raw.all
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: recipes_url }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: recipes_url }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_recipe_materials
    @recipe = Recipe.find(params[:id])
    @materials = @recipe.recipe_materials
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :quantity, :measure, recipe_materials_attributes: [ :id, :raw_id, :quantity, :_destroy ])
    end
end

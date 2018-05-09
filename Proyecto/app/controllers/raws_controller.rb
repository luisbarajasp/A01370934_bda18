class RawsController < ApplicationController
  before_action :set_raw, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Raws", :raws_path

  # GET /raws
  # GET /raws.json
  def index
    @raws = Raw.all
  end

  # GET /raws/1
  # GET /raws/1.json
  def show
    add_breadcrumb "#{@raw.name}", :raw_path
  end

  # GET /raws/new
  def new
    add_breadcrumb "New", :new_raw_path
    @raw = Raw.new(raw_inventories: [RawInventory.new])
  end

  # GET /raws/1/edit
  def edit
    add_breadcrumb "#{@raw.name}", :edit_raw_path
  end

  # POST /raws
  # POST /raws.json
  def create
    @raw = Raw.new(raw_params)
    respond_to do |format|
      if @raw.save
        format.html { redirect_to raws_url, notice: 'Raw was successfully created.' }
        format.json { render :show, status: :created, location: raws_url }
      else
        format.html { render :new }
        format.json { render json: @raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raws/1
  # PATCH/PUT /raws/1.json
  def update
    respond_to do |format|
      if @raw.update(raw_params)
        format.html { redirect_to raws_url, notice: 'Raw was successfully updated.' }
        format.json { render :show, status: :ok, location: raws_url }
      else
        format.html { render :edit }
        format.json { render json: @raw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raws/1
  # DELETE /raws/1.json
  def destroy
    @raw.raw_inventories.map {|i| i.destroy}
    @raw.destroy
    respond_to do |format|
      format.html { redirect_to raws_url, notice: 'Raw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_raw_inventories
    @raw = Raw.find(params[:id])
    @raw_inventories = @raw.raw_inventories.active
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw
      @raw = Raw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_params
      params.require(:raw).permit(:id, :name, :type, :measure, :cost, raw_inventories_attributes: [ :id, :quantity, :expired_at, :_destroy ])
    end
end

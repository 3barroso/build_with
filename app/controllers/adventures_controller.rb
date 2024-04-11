class AdventuresController < ApplicationController
  before_action :set_adventure, only: %i[show edit update destroy]

  # GET /adventures or /adventures.json
  def index
    @adventures = Adventure.all
  end

  # GET /adventures/1 or /adventures/1.json
  def show
  end

  # GET /adventures/new
  def new
    @adventure = Adventure.new
    @adventure.adventure_addresses.build.build_address
  end

  # GET /adventures/1/edit
  def edit
  end

  # POST /adventures or /adventures.json
  def create
    @adventure = Adventure.new(adventure_params)

    respond_to do |format|
      if @adventure.save
        format.html { redirect_to adventure_url(@adventure), notice: "Adventure was successfully created." }
        format.json { render :show, status: :created, location: @adventure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventures/1 or /adventures/1.json
  def update
    respond_to do |format|
      if @adventure.update(adventure_params)
        format.html { redirect_to adventure_url(@adventure), notice: "Adventure was successfully updated." }
        format.json { render :show, status: :ok, location: @adventure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventures/1 or /adventures/1.json
  def destroy
    @adventure.destroy!

    respond_to do |format|
      format.html { redirect_to adventures_url, notice: "Adventure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_adventure
    @adventure = Adventure.includes(:addresses).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def adventure_params
    params.require(:adventure).permit(
      :title,
      :description,
      :status,
      :shareable,
      :active,
      :target_completion,
      adventure_addresses_attributes: [:description, :id,
        address_attributes: [:id, :street_number, :street, :city, :state, :postal_code, :location_type]
      ]
    )
  end
end

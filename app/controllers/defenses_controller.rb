class DefensesController < ApplicationController
  before_action :set_defense, only: [:show, :edit, :update, :destroy]

  # GET /defenses
  # GET /defenses.json
  def index
    @defenses = Defense.all
  end

  # GET /defenses/1
  # GET /defenses/1.json
  def show
  end

  # GET /defenses/new
  def new
    @defense = Defense.new
  end

  # GET /defenses/1/edit
  def edit
  end

  # POST /defenses
  # POST /defenses.json
  def create
    @defense = Defense.new(defense_params)

    respond_to do |format|
      if @defense.save
        format.html { redirect_to @defense, notice: 'Defense was successfully created.' }
        format.json { render :show, status: :created, location: @defense }
      else
        format.html { render :new }
        format.json { render json: @defense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /defenses/1
  # PATCH/PUT /defenses/1.json
  def update
    respond_to do |format|
      if @defense.update(defense_params)
        format.html { redirect_to @defense, notice: 'Defense was successfully updated.' }
        format.json { render :show, status: :ok, location: @defense }
      else
        format.html { render :edit }
        format.json { render json: @defense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defenses/1
  # DELETE /defenses/1.json
  def destroy
    @defense.destroy
    respond_to do |format|
      format.html { redirect_to defenses_url, notice: 'Defense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defense
      @defense = Defense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def defense_params
      params.require(:defense).permit(:description)
    end
end

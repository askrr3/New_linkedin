class Network2sController < ApplicationController
  before_action :set_network2, only: [:show, :edit, :update, :destroy]

  # GET /network2s
  # GET /network2s.json
  def index
    @network2s = Network2.all
  end

  # GET /network2s/1
  # GET /network2s/1.json
  def show
  end

  # GET /network2s/new
  def new
    @network2 = Network2.new
  end

  # GET /network2s/1/edit
  def edit
  end

  # POST /network2s
  # POST /network2s.json
  def create
    @network2 = Network2.new(network2_params)

    respond_to do |format|
      if @network2.save
        format.html { redirect_to @network2, notice: 'Network2 was successfully created.' }
        format.json { render :show, status: :created, location: @network2 }
      else
        format.html { render :new }
        format.json { render json: @network2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network2s/1
  # PATCH/PUT /network2s/1.json
  def update
    respond_to do |format|
      if @network2.update(network2_params)
        format.html { redirect_to @network2, notice: 'Network2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @network2 }
      else
        format.html { render :edit }
        format.json { render json: @network2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network2s/1
  # DELETE /network2s/1.json
  def destroy
    @network2.destroy
    respond_to do |format|
      format.html { redirect_to network2s_url, notice: 'Network2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network2
      @network2 = Network2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network2_params
      params.require(:network2).permit(:user_id, :networkee_id)
    end
end

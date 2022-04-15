class LendsController < ApplicationController
  before_action :set_lend, only: %i[ show edit update destroy ]

  # GET /lends or /lends.json
  def index
    @lends = Lend.all
  end

  # GET /lends/1 or /lends/1.json
  def show
  end

  # GET /lends/new
  def new
    @lend = Lend.new
  end

  # GET /lends/1/edit
  def edit
  end

  # POST /lends or /lends.json
  def create
    @lend = Lend.new(lend_params)

    respond_to do |format|
      if @lend.save
        format.html { redirect_to @lend, notice: "Lend was successfully created." }
        format.json { render :show, status: :created, location: @lend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lends/1 or /lends/1.json
  def update
    respond_to do |format|
      if @lend.update(lend_params)
        format.html { redirect_to @lend, notice: "Lend was successfully updated." }
        format.json { render :show, status: :ok, location: @lend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lends/1 or /lends/1.json
  def destroy
    @lend.destroy
    respond_to do |format|
      format.html { redirect_to lends_url, notice: "Lend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lend
      @lend = Lend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lend_params
      params.fetch(:lend, {}).permit(:book_id, :user_id, :return_date)
    end
end

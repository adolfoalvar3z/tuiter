class TuitsController < ApplicationController
  before_action :set_tuit, only: %i[ show edit update destroy ]

  # GET /tuits or /tuits.json
  def index
    @pagy, @tuits = pagy(Tuit.all)
  end

  # GET /tuits/1/edit
  def edit
  end

  def create
    @tuit = Tuit.new(description: params[:description], username: params[:username])

      if @tuit.save
        redirect_to root_path, notice: "Tuit was successfully created."
      else
        redirect_to root_path, notice: "caca Tuit was successfully created."
      end
  end

  # PATCH/PUT /tuits/1 or /tuits/1.json
  def update
    respond_to do |format|
      if @tuit.update(tuit_params)
        format.html { redirect_to tuit_url(@tuit), notice: "Tuit was successfully updated." }
        format.json { render :show, status: :ok, location: @tuit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tuit.errors, status: :unprocessable_entity }
      end
    end
  end

end

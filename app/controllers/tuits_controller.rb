class TuitsController < ApplicationController

  # GET /tuits or /tuits.json
  def index
    @pagy, @tuits = pagy(Tuit.all.order(updated_at: :desc))
    @consulta = params[:buscar]
    if @consulta.present?
      @tuits = Tuit.search_full_text(@consulta)
    end
  end

  # GET /tuits/1/edit
  def edit
    @tuit = Tuit.find(id: params[:id])
  end

  def destroy
    @tuit = Tuit.find(params[:id])
    if @tuit.destroy
      redirect_to root_path, notice: "Tuit ha sido destruido."
    else
      redirect_to root_path, notice: "Tuit no ha sido destruido, Elon Musk lo considera muy valioso."
    end

  end

  def create
    @tuit = Tuit.new(description: params[:description], username: params[:username])
      if @tuit.save
        redirect_to root_path, notice: "Tuit ha sido creado."
      else
        redirect_to root_path, notice: "Tu Tuit ha sido rechazado por Elon Musk."
      end
  end

  #
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

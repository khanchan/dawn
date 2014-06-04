class Api::DrainsController < Api::AppsubController

  before_action :find_app, only: [:index, :show, :destroy]
  before_action :find_drain, only: [:show, :destroy]

  def create
    drain_url = params[:url]

    if !@app.drains.where(url: drain_url).exists?
      @drain = @app.drains.create!(app: @app, url: drain_url)
      render 'drain', status: 200
    else
      response = { id: "drain.exists", message: "Drain #{url} exists" }
      render json: response, status: 409
    end
  end

  def index
    @drains = @app.drains
    render status: 200
  end

  def show
    render 'drain', status: 200
  end

  def destroy
    @drain.destroy
    head 200
  end

  private def find_drain
    if drain = @app.drains.where(id: params[:id]).first
      @drain = drain
    else
      head 404
    end
  end

end
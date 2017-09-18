class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :update, :destroy]

  # returns the first n alerts that haven't been searched in the longest time
  # GET /alerts/queue/?limit
  def queue
    limit = params[:limit] ? params[:limit].to_i : 1 

    @alerts = Alert.where('0 < state').order('last_searched NULLS FIRST').limit(limit)

    render json: @alerts
  end

  # Returns the amount of alerts
  # GET /metadata
  def metadata
    metadata = Hash.new
    metadata[:alert_count] = Alert.count
    metadata[:active_alert_count] = Alert.where('0 < state').count
    metadata[:deal_count] = Deal.count

    render json: metadata
  end

  # GET /alerts
  def index
    if params[:user_id]
      @alerts = Alert.where user_id: params[:user_id]
    else
      @alerts = Alert.all
    end

    render json: @alerts
  end

  # GET /alerts/1
  def show
    render json: @alert
  end

  # POST /alerts
  def create
    @alert = Alert.new(alert_params)

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerts/1
  def update
    if @alert.update(alert_params)
      render json: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alerts/1
  def destroy
    @alert.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alert_params
      params.require(:alert).permit(:email, :name, :user_id, :state, :outbound_start, :outbound_end, :inbound_start, :inbound_end, :start_airports, :end_airports, :trip_len_min, :trip_len_max, :price_limit, :auto_alert, :last_searched)
    end
end

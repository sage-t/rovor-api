class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :update, :destroy]

  # GET /deals
  def index
    Deal.destroy_old_and_orphaned

    @deals = Deal.all

    render json: @deals
  end

  # GET /deals/1
  def show
    render json: @deal
  end

  # POST /deals
  def create
    @deal = Deal.new(deal_params)

    if @deal.alert_id
      alert = Alert.find(@deal.alert_id).update(last_searched: DateTime.now)
      alert.new_deal_routine
    end

    if @deal.save
      render json: @deal, status: :created, location: @deal
    else
      render json: @deal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deals/1
  def update
    if @deal.update(deal_params)
      render json: @deal
    else
      render json: @deal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deals/1
  def destroy
    @deal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deal_params
      params.require(:deal).permit(:alert_id, :price, :start_airport, :end_airport, :outbound, :inbound, :link)
    end
end

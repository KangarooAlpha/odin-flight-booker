class FlightsController < ApplicationController
  def index
    @departure_airports = Airport.joins(:departing_flights).distinct
    @arrival_airports = Airport.joins(:arriving_flights).distinct
    @date = Flight.select(:date).distinct.order(:date)
    @num_tickets = params[:num_tickets]
    if search_params
      @flights = Flight.where(
        departure_airport: params[:departure_airport],
        arrival_airport: params[:arrival_airport],
        date: params[:date].to_date.all_day
      )

    end
    respond_to do |format|
        format.html # index.html.erb
        format.xml  { render xml: [ @date.pluck(:date), @departure_airports.pluck(:airport_code) ] }
        format.json { render json: @date }
      end
  end

  def new
    @fliight = Flight.find(params[:flight_id])
    @num_ticekts = params[:num_tickets].to_i
  end

  private
  def search_params
    params[:departure_airport].present? &&
    params[:arrival_airport].present? &&
    params[:date].present?
  end
end

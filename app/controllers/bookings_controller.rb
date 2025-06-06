class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:num_tickets].to_i
    @booking = Booking.new(flight: @flight)

    @num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      puts "Redirecting to booking show page with ID #{@booking.id}"
      redirect_to booking_path(@booking)
    else
      puts @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id,
     passengers_attributes: [ :name, :email ])
  end
end

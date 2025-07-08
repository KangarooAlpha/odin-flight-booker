class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:num_tickets].to_i
    @booking = Booking.new(flight: @flight)

    @num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        puts "Redirecting to booking show page with ID #{@booking.id}"
        @booking.passengers.each do |passenger|
          PassengerMailer.with(booking: @booking, passenger: passenger).welcome_email.deliver_now
        end
        format.html { redirect_to booking_path(@booking) }
      else
        puts @booking.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
      end
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

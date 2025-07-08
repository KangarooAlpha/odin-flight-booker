class PassengerMailer < ApplicationMailer
  default from: "notfications@flightBooker.com"

  def welcome_email
    @booking = params[:booking]
    @flight = @booking.flight
    @passenger = params[:passenger]

    mail(
    to: @passenger.email,
    subject: "Your Flight is Booked!"
    )
  end
end

class PassengerMailer < ApplicationMailer
  default from: "notfications@flightBooker.com"

  def welcome_email(booking, passenger)
    @booking = booking
    @flight = booking.flight
    @passenger = passenger

    mail(
    to: @passenger.email,
    subject: "Your Flight is Booked!"
    )
  end
end

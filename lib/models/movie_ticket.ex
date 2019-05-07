defmodule TicketBooking.Models.MovieTicket do
  defstruct [:seat_no, date: Date.utc_today(), price: 100]
end

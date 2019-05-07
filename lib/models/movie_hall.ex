defmodule TicketBooking.Models.MovieHall do
  defstruct [:id, seat_count: 0, bookings: []]

  alias TicketBooking.Models.MovieTicket

  def block_ticket(%__MODULE__{} = movie_hall, seat_no) do
    new_ticket = %MovieTicket{seat_no: seat_no}

    %__MODULE__{
      movie_hall
      | seat_count: movie_hall.seat_count + 1,
        bookings: [new_ticket | movie_hall.bookings]
    }
  end

  def new_hall(id) do
    %__MODULE__{
      id: id
    }
  end
end

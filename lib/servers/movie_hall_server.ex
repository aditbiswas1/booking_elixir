defmodule TicketBooking.Servers.MovieHallServer do
  use Agent

  alias TicketBooking.Models.MovieHall

  def start_link(id: id) do
    Agent.start_link(fn -> MovieHall.new_hall(id) end)
  end

  def book_ticket(pid, seat_no) do
    Agent.cast(pid, fn hall ->
      :timer.sleep(4000)
      MovieHall.block_ticket(hall, seat_no)
    end)
  end

  def show_state(pid) do
    Agent.get(pid, fn hall -> hall end)
  end
end

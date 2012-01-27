require 'socket'

class LiveConsole::IOMethods::UnixSocketConnection

  attr_accessor :raw_input, :raw_output

  def initialize(server, opts)
    @server = server
    @opts = opts
  end

  def start
    begin
      self.raw_input = self.raw_output = @server.accept_nonblock
      raw_input.sync = true
      return true
    rescue Errno::EAGAIN, Errno::ECONNABORTED, Errno::EPROTO,
      Errno::EINTR => e
      select
      retry
    end
  end

  def stop
    select
    raw_input.close
  end

  def select
    IO.select [@server], [], [], 1 if @server
  end

  def authenticate
    true
  end
end

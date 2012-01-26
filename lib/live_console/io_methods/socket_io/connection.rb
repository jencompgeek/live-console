class LiveConsole::IOMethods::SocketIOConnection

  attr_accessor :raw_input, :raw_output

  def initialize(server)
    @server = server
  end

  def start
		begin
			IO.select([@server])
			self.raw_input = self.raw_output = @server.accept
			return true
		rescue Errno::EAGAIN, Errno::ECONNABORTED, Errno::EPROTO,
			   Errno::EINTR => e
			select
			retry
		end
	end

	def stop
		select
		raw_input.close rescue nil
	end

  def select
		IO.select [@server], [], [], 1 if @server
	end
end

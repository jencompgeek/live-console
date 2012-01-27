require 'live_console/io_methods/unix_socket/connection'
require 'socket'

class LiveConsole::IOMethods::UnixSocket
  DefaultOpts = {
    :mode => 0600,
    :uid => Process.uid,
    :gid => Process.gid,
  }
  RequiredOpts = DefaultOpts.keys + [:path]

  include LiveConsole::IOMethods::IOMethod

  def initialize(opts)
    super opts
    @server = UNIXServer.new path
  end

  def get_connection
    LiveConsole::IOMethods::UnixSocketConnection.new(@server,opts)
  end
end

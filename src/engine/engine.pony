class Engine
  let _gui: OutStream
  let _logger: OutStream

  new create(gui: OutStream, logger: OutStream) =>
    _gui = gui
    _logger = logger

  fun ref apply(command: String) =>
    _logger.print("Received command: " + command)

    if command == "uci" then
      _gui.print("id name Powny 0.1")
      _gui.print("id author Simu & Sandy")
      _gui.print("uciok")
    elseif command == "isready" then
      _gui.print("readyok")
    elseif command.contains("go") then
      _gui.print("bestmove e7e5")
    else
      _logger.print("Unhandled command: " + command)
    end
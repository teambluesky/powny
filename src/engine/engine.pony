class Engine
  let _out: OutStream
  let _logger: OutStream

  new create(out: OutStream, logger: OutStream) =>
    _out = out
    _logger = logger
    _logger.print("Engine started, waiting for commands ...")

  fun ref apply(command': Array[U8] iso) =>
    let command = String.from_array(consume command')
    _logger.print("Received command: " + command)

    if command == "uci" then
      _out.print("id name Powny 0.1")
      _out.print("id author Simu & Sandy")
      _out.print("uciok")
    elseif command == "isready" then
      _out.print("readyok")
    elseif command.contains("go") then
      _out.print("bestmove e7e5")
    else
      _logger.print("Unhandled command: " + command)
    end
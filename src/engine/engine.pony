class Engine
  let _out: OutStream
  let _logger: OutStream
  var _lastCommand: Array[U8] iso

  new create(out: OutStream, logger: OutStream) =>
    _out = out
    _logger = logger
    _lastCommand = recover Array[U8] end
    _logger.print("Engine started, waiting for commands ...")

  fun ref apply(command: Array[U8] iso) =>
    _logger.print("got called by input handler")
    let c: Array[U8] iso = _lastCommand = consume command
    _logger.print("command consumed")
    let string = String.from_array(consume c)
    _logger.print("Received command: " + string)
    if string == "uci" then
      _out.print("id name Powny 0.1")
      _out.print("id author Simu & Sandy")
      _out.print("uciok")
    elseif string == "isready" then
      _out.print("readyok")
    elseif string.contains("go") then
      _out.print("bestmove a7a5")
    else
      _logger.print("Unhandled command: " + string)
    end
    _logger.print("engine code done")

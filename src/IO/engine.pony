class Engine
  let _out: OutStream

  new create(out: OutStream) =>
    _out = out
    //_out.print("Engine started, waiting for commands ...")

  fun ref apply(command: Array[U8] iso) =>
    let string = String.from_array(consume command)
    if string == "uci" then
      _out.print("id name Ches2 0.1")
      _out.print("id author Simu & Sandy")
      _out.print("uciok")
    elseif string == "isready" then
      _out.print("readyok")
    else
      _out.print(string)
    end

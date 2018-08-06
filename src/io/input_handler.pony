use "package:../engine"

class InputNotifier
  let _env: Env
  var _buf: Array[U8] iso
  let _engine: Engine
  let _logger: OutStream

  new create(env': Env, logger: OutStream, engine: Engine) =>
    _env = env'
    _buf = recover iso Array[U8] end
    _engine = engine
    _logger = logger

  fun ref apply(data: Array[U8] iso) =>
    for char in (consume data).values() do
      let s = String.from_array([char])
      _logger.write(s)
      if (char == '\n') or (char == 0x0A) then
        _logger.print("saw newline")
        let bufferOutIso = _buf = recover iso Array[U8] end
        _logger.print("calling engine now")
        _engine(consume bufferOutIso)
        _logger.print("engine call done")
      else
        _buf.push(char)
      end
    end

  fun ref dispose() =>
    _env.out.print("disposed")
use "package:../engine"

class InputNotifier
  let _env: Env
  let _engine: Engine

  new create(env': Env, engine: Engine) =>
    _env = env'
    _engine = engine

  fun ref apply(data: Array[U8] iso) =>
    let buffer = recover String.from_iso_array(consume data) end

    // Remove newline ('\n') character for simpler string comparison
    buffer.delete(ISize.from[USize](buffer.size() - 1))

    _engine(consume buffer)

  fun ref dispose() =>
    _env.out.print("disposed")
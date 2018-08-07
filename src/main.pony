use "io"
use "engine"
use "files"

actor Main
  new create(env: Env) =>
    try
      let auth = env.root as AmbientAuth
      let file = recover File(FilePath(auth, "engine_input.txt")?) end
      let fileStream = FileStream(consume file)

      var engine = recover Engine(env.out, fileStream) end

      var inputNotifier = recover InputNotifier(env, consume engine) end
      env.input(consume inputNotifier, 512)
    else
      env.err.print("Couldn't initialize dependencies")
    end

class Test
  let _env: Env
  var _buf: Array[U8] iso

  new create(env: Env) =>
    _env = env
    _buf = ['h'; 'e'; 'y']

  fun ref test(bf: Array[U8] iso) =>
    let b = _buf = consume bf
    _env.out.print(String.from_array(consume b))

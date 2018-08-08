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
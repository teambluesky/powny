use "io"
use "engine"
use "files"

actor Main
  new create(env: Env) =>
    try
      let auth = env.root as AmbientAuth
      let file = recover File(FilePath(auth, "out.txt")?) end
      let fileStream = FileStream(consume file)

      var engine = recover Engine(env.out, fileStream) end

      let file2 = recover File(FilePath(auth, "out2.txt")?) end
      let fileStream2 = FileStream(consume file2)

      var inputNotifier = recover InputNotifier(env, fileStream2, consume engine) end
      env.input(consume inputNotifier, 512)
    else
      env.err.print("Couldn't initialize dependencies")
    end
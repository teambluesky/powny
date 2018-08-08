use "ponytest"

use engine = "package:../engine"
use io = "package:../io"
use integration_tests = "integration_tests"

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)
  
  new make() =>
    None
  
  fun tag tests(test: PonyTest) =>
    engine.Main.make().tests(test)
    io.Main.make().tests(test)
    integration_tests.Main.make().tests(test)
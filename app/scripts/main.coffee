require.config
  paths:
    app: "app"
    jquery: "../components/jquery/jquery"
    webgl_utils: "vendor/webgl-utils"
    webgl_debug: "vendor/webgl-debug"
    cuon_utils: "vendor/cuon-utils"
    triangle: "triangle"

  shim:
    bootstrap:
      deps: ["jquery"]
      exports: "jquery"

require ["triangle", "jquery", "text!shaders/vertex.glsl"], (App, $, vertex) ->
  App.run()

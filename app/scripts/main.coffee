require.config
  paths:
    jquery: "../components/jquery/jquery"
    bootstrap: "vendor/bootstrap"

  shim:
    bootstrap:
      deps: ["jquery"]
      exports: "jquery"

require ["app", "jquery"], (app, $) ->
  "use strict"

  console.log app
  console.log "Running jQuery %s", $().jquery

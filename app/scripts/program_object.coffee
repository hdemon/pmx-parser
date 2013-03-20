define [
  'namespaces'
  'webgl_utils'
  'webgl_debug'
], (WebGL) ->

  class WebGL.ProgramObject
    constructor: (@gl) ->
      @object = @gl.createProgram()

    get: ->
      @object

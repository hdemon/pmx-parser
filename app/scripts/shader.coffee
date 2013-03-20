define [
  'namespaces'
  'webgl_utils'
  'webgl_debug'
], (WebGL) ->

  class WebGL.Shader
    constructor: (@gl, @source) ->

    compile: ->
      @gl.shaderSource @object, @source
      @gl.compileShader @object
      @gl.getShaderParameter(@object, @gl.COMPILE_STATUS)

    get: ->
      @object

  class WebGL.VertexShader extends WebGL.Shader
    constructor: (@gl, @source) ->
      @object = @gl.createShader(@gl.VERTEX_SHADER)
      @compile()

  class WebGL.FragmentShader extends WebGL.Shader
    constructor: (@gl, @source) ->
      @object = @gl.createShader(@gl.FRAGMENT_SHADER)
      @compile()

define [
  'namespaces'
  'webgl_utils'
  'webgl_debug'
], (WebGL) ->

  # 頂点情報をvertex shaderに渡すためには、バッファオブジェクトを介さなければならない
  # OpenGLには頂点配列、頂点配列バッファなどの他の選択肢が存在するが、WebGLはバッファオブジェクトのみ。
  class WebGL.bufferObject
    constructor: (@gl) ->
      @buffer = @gl.createBuffer()
      @_bind()

    # WebGLコンテキスト中のバインディングポイントに対して自分自身をバインドする。
    _bind: ->
      # バインディングポイントは2種類あり、その1つがARRAY_BUFFER
      # http://www.khronos.org/registry/webgl/specs/1.0/#5.13.5
      @gl.bindBuffer @gl.ARRAY_BUFFER, @buffer

    # これだと複数のバッファオブジェクトを扱う時に全部unbindしちゃう？
    # TODO: 複数のバッファオブジェクトを扱う時の作法を調べてどうにかする。
    unbind: ->
      @gl.bindBuffer @gl.ARRAY_BUFFER, null

    writein: (vertices) ->
      @gl.bufferData @gl.ARRAY_BUFFER, vertices, @gl.STATIC_DRAW

    point: (attributeName) ->
      attribute = @gl.getAttribLocation(@gl.program, attributeName)
      @gl.vertexAttribPointer attribute, 2, @gl.FLOAT, false, 0, 0
      @gl.enableVertexAttribArray attribute

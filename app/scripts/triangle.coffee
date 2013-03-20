define [
  'webgl'
  'jquery'
  "text!shaders/vertex.glsl"
  "text!shaders/fragment.glsl"
], (WebGL, $, vertex, fragment) ->

  run: ->
    # WebGLコンテキストの取得
    canvas = document.getElementById("webgl")
    gl = WebGLUtils.setupWebGL(canvas)

    vertexShader = new WebGL.VertexShader(gl, vertex).get()
    fragmentShader = new WebGL.FragmentShader(gl, fragment).get()

    # プログラムオブジェクトを作成する
    program = new WebGL.ProgramObject(gl).get()

    # プログラムオブジェクトに対して、シェーダオブジェクトを設定する
    gl.attachShader program, vertexShader
    gl.attachShader program, fragmentShader

    gl.linkProgram program
    gl.useProgram program
    gl.program = program

    # 型付き配列を用いて、頂点情報を作成
    vertices = new Float32Array [
      0,    0.5,  -0.5,
      -0.5, 0.5,  -0.5,
      0.5,  0.5,  0,
      -0.5, 1,    -0.5
    ]

    # バッファオブジェクトを作成し、指定したWebGLコンテキストに対してバインドする。
    bufferObj = new WebGL.bufferObject(gl)
    # 先の頂点情報をバッファオブジェクトに書き込み、
    bufferObj.writein vertices
    # a_Positionというattribute変数に割り当てる。
    bufferObj.point "a_Position"
    # バッファオブジェクトのバインドを解除する。
    bufferObj.unbind()

    gl.clearColor 0, 0, 0, 1
    gl.clear gl.COLOR_BUFFER_BIT

    # 描画
    gl.drawArrays gl.LINE_LOOP, 0, vertices.length / 3

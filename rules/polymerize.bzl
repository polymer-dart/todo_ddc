def _impl(ctx):
  # You may use print for debugging.
  #print("This rule does nothing")
  ctx.file_action(
   output = ctx.outputs.js,
   content = "prova");

polymer_library = rule(
  implementation=_impl,
  attrs={
      "srcs": attr.label_list(allow_files=True),
      "deps": attr.label_list(allow_files=False),
  },
  outputs = {
    "js" : "%{name}.js"
  })

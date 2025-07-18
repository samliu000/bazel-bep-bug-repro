def _hello_world_impl(ctx):
    hello_out = ctx.actions.declare_file("hello_world.txt")

    ctx.actions.run_shell(
        command = "echo 'Hello world!!!' > {}".format(hello_out.path),
        outputs = [hello_out],
        use_default_shell_env = True,
        execution_requirements = {
            "no-cache": "1",
            "no-remote": "1",
        }
    )
    return [
        DefaultInfo(files = depset([hello_out])),
    ]

hello_world_rule = rule(
    attrs = {},
    implementation = _hello_world_impl,
)

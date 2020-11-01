# Autogenerated wrapper script for ECOS_jll for armv7l-linux-musleabihf
export libecos

JLLWrappers.@generate_wrapper_header("ECOS")
JLLWrappers.@declare_library_product(libecos, "libecos.so")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libecos,
        "lib/libecos.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()

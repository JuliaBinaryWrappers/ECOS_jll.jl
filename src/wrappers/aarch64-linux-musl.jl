# Autogenerated wrapper script for ECOS_jll for aarch64-linux-musl
export libecos

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libecos`
const libecos_splitpath = ["lib", "libecos.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libecos_path = ""

# libecos-specific global declaration
# This will be filled out by __init__()
libecos_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libecos = "libecos.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"ECOS")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libecos_path = normpath(joinpath(artifact_dir, libecos_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libecos_handle = dlopen(libecos_path)
    push!(LIBPATH_list, dirname(libecos_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()


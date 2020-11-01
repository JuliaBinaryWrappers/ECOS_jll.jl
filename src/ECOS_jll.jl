# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule ECOS_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("ECOS")
JLLWrappers.@generate_main_file("ECOS", UUID("c2c64177-6a8e-5dca-99a7-64895ad7445f"))
end  # module ECOS_jll

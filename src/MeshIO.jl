VERSION >= v"0.4.0-dev+6521" && __precompile__(true)
module MeshIO

using GeometryTypes
using ColorTypes
using Compat
import FileIO

import FileIO: DataFormat, @format_str, Stream, File, filename, stream, skipmagic
@compat import Base.show


include("io/parse_utilities.jl")
include("io/off.jl")
include("io/ply.jl")
include("io/stl.jl")
include("io/obj.jl")
include("io/2dm.jl")
include("io/abaqus_inp.jl")

function load{format}(fn::File{format}, MeshType=GLNormalMesh)
    open(fn) do s
        skipmagic(s)
        load(s, MeshType)
    end
end
function save{format}(fn::File{format}, msh::AbstractMesh)
    open(fn, "w") do s
        save(s, msh)
    end
end

end # module

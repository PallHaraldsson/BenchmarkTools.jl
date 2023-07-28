module BenchmarkTools

using JSON
using Base.Iterators

using Logging: @logmsg, LogLevel
using Statistics
using UUIDs: uuid4
using Printf
using Profile

import LinuxPerf
import Random

# TODO: delete the following line once https://github.com/JuliaPerf/LinuxPerf.jl/pull/32
# is merged and a new release of LinuxPerf has been made.
const parse_groups = LinuxPerf.parse_groups

const BENCHMARKTOOLS_VERSION = v"1.0.0"

##############
# Parameters #
##############

include("parameters.jl")

export loadparams!

##############
# Trial Data #
##############

include("trials.jl")

export gctime,
       memory,
       allocs,
       params,
       ratio,
       judge,
       isinvariant,
       isregression,
       isimprovement,
       median,
       mean,
       rmskew!,
       rmskew,
       trim

##################
# Benchmark Data #
##################

include("groups.jl")

export BenchmarkGroup,
       invariants,
       regressions,
       improvements,
       @tagged,
       addgroup!,
       leaves,
       @benchmarkset,
       @case,
       clear_empty!

######################
# Execution Strategy #
######################

include("execution.jl")

export tune!,
       warmup,
       @ballocated,
       @benchmark,
       @benchmarkable,
       @belapsed,
       @btime,
       @bprofile

#################
# Serialization #
#################

include("serialization.jl")

end # module BenchmarkTools

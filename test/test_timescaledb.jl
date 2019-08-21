module TestTimescaleDB

using Test
using TSML

function test_timescaledb()
  tsdb = TimescaleDB()
  mpipeline = Pipeline(Dict(
         :transformers => [tsdb]
     )
  )
  fit!(mpipeline)
  respipe = transform!(mpipeline)
  @test sum(respipe.Value) ≈ 560997.0
  @test nrow(respipe) == 48349
  @test ncol(respipe) == 2
end
@testset "TimescaleDB" begin
  test_timescaledb()
end

end

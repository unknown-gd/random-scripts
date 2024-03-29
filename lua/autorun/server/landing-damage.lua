local TraceHull = util.TraceHull
local ceil = math.ceil
local Vector = Vector

local traceResult = {}
local trace = { output = traceResult, mask = MASK_SOLID }

local bulletData = { HullSize = 16 }

hook.Add( "OnPlayerHitGround", "Landing Damage", function( ply, _, __, speed )
    trace.filter = ply
    trace.start = ply:GetPos()
    trace.endpos = trace.start - Vector( 0, 0, speed )
    trace.mins, trace.maxs = ply:GetCollisionBounds()
    TraceHull( trace )

    local entity = traceResult.Entity
    if entity:IsValid() and entity:IsSolid() then
        bulletData.Damage = ceil( speed / 100 )
        bulletData.Src = traceResult.StartPos
        bulletData.Dir = traceResult.Normal
        bulletData.Distance = speed
        ply:FireBullets( bulletData )
    end
end )

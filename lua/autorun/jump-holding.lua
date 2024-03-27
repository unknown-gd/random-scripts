hook.Add( "StartCommand", "Jump Holding", function( ply, cmd )
    if cmd:KeyDown( IN_JUMP ) and not ply:IsOnGround() then
        if ply:GetMoveType() ~= MOVETYPE_WALK then return end
        cmd:RemoveKey( IN_JUMP )
    end
end )

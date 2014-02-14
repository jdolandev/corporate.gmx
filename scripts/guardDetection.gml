var accel, fric;
if (on_ground) {
    accel = S_RUN_ACCEL;
    fric = S_RUN_FRIC;
} else {
    accel = S_AIR_ACCEL;
    fric = S_AIR_FRIC;
}


//follow the player!
if( dist2D( x, y, obj_player.x, obj_player.y ) < 128 ){
    image_speed = 0.5;
    //If you're to the left of the guard
    if( obj_player.x < x ){
        if (hspd > 0)
            hspd = approach( hspd, 0, fric );
        
        hspd = approach( hspd, -S_MAX_H, accel ); 
        sprite_index = spr_guardL;
    }
    
    //If you're to the right of the guard
    else if( obj_player.x > x ){
        if (hspd < 0)
            hspd = approach( hspd, 0, fric );
        
        hspd = approach( hspd, S_MAX_H, accel ); 
        sprite_index = spr_guardR;
    }
    
    //Jump
    if( on_ground && y - 16 > obj_player.y ){
        //Check if you're on a slope
        if( !place_meeting( x, y + 1, obj_slopeR2_mask ) && 
            !place_meeting( x, y + 1, obj_slopeL2_mask)){
            vspd = S_JUMP_SPEED;
        }
    }
}

else{
    image_speed = 0;
    //Stop moving
    hspd = approach( hspd, 0, fric );
}

//Gravity
vspd = approach( vspd, S_MAX_V, S_GRAVITY );

//Returns true if the object is standing on solid ground 
//(including jump-thru platforms), false otherwise.

return place_meeting( x, y+1, obj_floor ) 
    || (place_meeting( x, y+1, obj_jumpthru ) && !place_meeting( x, y, obj_jumpthru ));

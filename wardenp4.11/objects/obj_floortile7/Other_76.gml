/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "zapframe7":
            //show_debug_message("ZAP FRAME ON TILE 7");
			//zaptime = true;
			alarm_set(0,2);
        break;
    }
}
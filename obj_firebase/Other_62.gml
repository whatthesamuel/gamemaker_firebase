/// @description Insert description here
// You can write your code in this editor
if ds_map_find_value(async_load, "id") == request
    {
    if ds_map_find_value(async_load, "status") == 0
        {
        r_str = ds_map_find_value(async_load, "result");
		r_json = json_parse(r_str);
		show_debug_message(string(r_json));
		if(variable_struct_exists(r_json, "kind"))
			if(r_json.kind =="identitytoolkit#SignupNewUserResponse")
				user.setIdToken(r_json.idToken);
		show_debug_message("http_response\n" + string(r_str));
		//game_end();
        }
    else
        {
        r_str = "null";
        }
    }
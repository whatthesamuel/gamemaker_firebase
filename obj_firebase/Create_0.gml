/// @description Insert description here
// You can write your code in this editor

#region private stuff
#macro API_KEY "AIzaSyBtH2oxLkLjydfXr-E9c0ZzvlRPzPJN7zQ"
#endregion

/*
reference links:
https://firebase.google.com/docs/reference/rest/database
https://developer.mozilla.org/ko/docs/Web/HTTP/Headers => no headers needed here(empty json);
https://console.firebase.google.com/project/text1-b3c49/database/text1-b3c49/data
https://firebase.google.com/docs/database/rest/save-data?authuser=0

https://firebase.google.com/docs/reference/rest/auth
https://firebase.google.com/docs/rules/basics?authuser=0#realtime-database
https://firebase.google.com/docs/reference/rest/auth#section-sign-in-anonymously


firebase_link = "https://text1-b3c49.firebaseio.com/Users.json"

*/

r_str = "";
r_json = "";


function User(_name, _msg) constructor{
	name = _name;
	msg = _msg;
	idToken = "";
	deposit = 10000;
	bitcoin = 0;
	etherium = 0;
	dogecoin = 0;
	
	static login = function(){
		
		var data = {
			returnSecureToken : bool(true)
		}
		
		var header = ds_map_create();
		ds_map_add(header,"Content-Type", "application/json");
		
		return http_request("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + API_KEY,
							"POST", header, json_stringify(data));
	}
	static setIdToken = function(_token) {
		if(string_length(idToken) < 1)
			idToken = string(_token);
	}
	
	static sendData = function(){
		show_debug_message("token: " + idToken);
		var data = {
			Username : name,
			message : msg,
			deposit : deposit
		}
		
		var header = ds_map_create();
		return http_request("https://text1-b3c49.firebaseio.com/Users/" + name + ".json?auth=" + idToken,
							"PUT", header, json_stringify(data));
	}
	
	static getData = function(){
		return http_get("https://text1-b3c49.firebaseio.com/Users/" + name + ".json?auth=" + idToken);
	}
	
	static updateData = function(_varname, _newval){
		var data = {}
		variable_struct_set(data, _varname, _newval);
		
		var header = ds_map_create();
		return http_request("https://text1-b3c49.firebaseio.com/Users/" + name + ".json?auth=" + idToken,
							"PATCH", header, json_stringify(data));
	}
	
	static deleteData = function(_varname, _newval){
		var header = ds_map_create();
		return http_request("https://text1-b3c49.firebaseio.com/Users/" + name + ".json?auth=" + idToken,
							"DELETE", header, json_stringify(data));		
	}
}
//request = user.sendData();

user = new User("serena", "hello serena");
request = user.login();
//show_debug_message(string(r_str));

#region deprecated
//var header = ds_map_create();
//var map = ds_map_create();
//ds_map_add(map, "john doe","welcome");
//var data= json_encode(map);
//show_debug_message(data);
//request = http_request(firebase_link, "PUT", json_stringify(header), data);
//request = http_post_string(firebase_link,json_stringify(map));
#endregion

/// @description Insert description here
// You can write your code in this editor
result = user.getData();
r_json = json_parse(r_str);
//r_json.deposit += 1000;

user.updateData("deposit", r_json.deposit + 1000);
function create_dialog(_messages){
	if (instance_exists(obj_dialog)) return;

	var _inst = instance_create_depth(0, 0, 0, obj_dialog);
	_inst.messages = _messages;
	_inst.current_message = 0;
}

char_colors = {
	"Congrats": c_yellow,
	"bob rpg": c_white,
	"Gobby": c_green,
    "evil gobby": c_red,
    "Man": c_yellow
}

end_dialog = [
{
	name: "Gobby",
	msg: "You havin some trouble?"
},

{
	name: "Man",
	msg: "You saved me! Thank you for saving me!"
},

{
	name: "Gobby",
	msg: "No problem dude, how did you get cornered anyway?"
},

{
	name: "Man",
	msg: "Can I just send you to the next area"
},

{
	name: "Gobby",
	msg: "Sure."
},
]

welcome_dialog = [
{
	name: "bob rpg",
	msg: "Hey green dude."
},

{
	name: "Gobby",
	msg: "My name is Gobby."
},

{
	name: "bob rpg",
	msg: "Ok Gobby. Listen, this cave is like, filled with baddies."
},

{
	name: "Gobby",
	msg: "Ok"
},

{
	name: "bob rpg",
	msg: "Go fight them or something"
},
]

evil_dialog = [
{
	name: "evil gobby",
	msg: "Gobby I hate you im evil gobby"
},

{
	name: "bob rpg",
	msg: "what are you, some kind of evil bob?"
},

{
	name: "evil gobby",
	msg: "no im evil gobby you nimwit now hush"
},

{
	name: "bob rpg",
	msg: "make me bruh"
},

{
	name: "Gobby",
	msg: "Can you two stop fighting?"
},
]
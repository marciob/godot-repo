### Learnings

Drafts and concepts while learning about Godot4.

---

##### nodes

each small piece of funcionality<br>
a node can inherit other nodes<br>
ex. of nodes:
`Node2D, CharacterBody2D, AnimationPlayer, etc`

<br>

##### scenes

a collection of nodes that work together to create a part of the game<br>
running a game in Godot necessitates at least one scene<br>
it creates a .tscn file (stands for text scene) which represents a scene in text format<br>
ex. of scenes:
`level scene, player character, menu scene, etc`

<br>

##### scripts

it’s a piece of code that provides custom behaviors to a node or a scene<br>
it needs to be attached to a node/scene<br>
it also can create code to interact with other nodes (like children, parents, etc)<br>
usually written in GDScript language and has .gd extension<br>
only 1 script can be attached to a node or scene<br>
(but you can have various nodes attached to the same node and each of them with their own script)<br>
when you attach a sript to a node or scene it won’t appear as a separate entity in the left dock, but a script symbol is created next to the node os scene, indicating there is a script attached to it<br>
ex. of use cases for scripts:
`for controlling character movements, for creating a game logic, for controlling animation, etc`
<br>

---

<br>

#### Different types of Nodes:

<br>

##### Area2D

used to identify when objects enter, exit or overlap a specific 2d area<br>
ex. of use cases:
`creating trigger zones, items to pick up, proximity detection, etc`

<br>

##### Label

used to display text on the screen<br>

<br>

##### RigidBody2D

used to represent object with physics capabilities (like a ball dropping, force, etc)<br>
<br>

##### Panel

container for grouping UI elements like labels, buttons, etc<br>
ex. of use cases:
`game menu, inventory screen, dialogue box`

<br>

##### Sprite2D

used to display 2d images or sprites<br>
it has manipulation properties for size, position, transparency, etc<br>
the picture is uploaded through the texture section

---

<br>

#### GDScript

<br>

##### extends

it's how to inherit a file or class<br>
only 1 class can be extended within the same script<br>
ex.:

```py
extends BaseClassFile
extends CharacterBody2D
```

<br>

##### virtual methods

base class that can be overrided<br>
usually they are methods predefined in global nodes and you override them to add your own logic<br>
there is a naming convetion to start with \_ on the virtual method name<br>
ex.:

```py
	_ready():
		print("Node is ready!")
```

<br>

##### pass

keyword to represent empty code<br>
ex.:

```py
	_ready():
		pass # used to avoid complaing about the function being empty
```

<br>

##### specifing type in a variable

a type can be specied for a variable, so if assigning a different type it will give an error<br>
ex.:

```py
	var my_variable: Node = Sprite.new() # variable of the type Node
	var my_another_varialbe := Sprite.new() # 'my_another_varialbe' is of type 'Sprite’, the type was ommited but the type can be inferred
```

<br>

##### \_ready()

virtual method called automatically when nodes (and its children) are loaded into the current scene and ready<br>
it's often used to initialize variables, connect signals, or setup parts of the node that depend on other nodes<br>
ex.:

```py
	func _ready():
		var random = RandomNumberGenerator.new()
		random.randomize()
		speed = random.randi_range(100, 300)  # Randomly sets speed between 100 and 300
```

<br>

##### \_process(delta)

virtual method updated on every frame of the game’s runtime<br>
runs code that updates at each frame<br>
delta argument is the time (in seconds) since the last frame<br>
it can be used for moving an object, checking conditions, etc<br>
ex.:

```py
	var counter = 0
	func _process(delta):
		counter += 1  # increases the counter by 1 every frame
```

<br>

##### class

by default, all scripts already are classes without a name<br>

<br>

##### how to inherit a unnamed class

```py
extends res://path/to/character.gd

var Character = load("res://path/to/character.gd") # loads character.gd
var character_node = Character.new() # create a new node instance from it
```

<br>

##### how to give a name to a class and give a name to it

a named class becomes globally available in all other GDScript files and doesn’t need to be imported into a new script<br>
inside the node that we wanna give a class name, we use class_name, like that example:<br>

```py
# Inside Character.gd script
class_name Character
# optionally you can give an icon image for that, like that:
# class_name Character, “res://interface/icons/item.png”

func talk():
    print("Hello!")
```

<br>

now that script is already named and we can inherit it into another script, like that:<br>

```py
# Inside another GDScript file
func _ready():
    var my_character = Character.new()
    my_character.talk()  # Prints "Hello!"
```

<br>

##### \_init()

it's like a constructor<br>
it's a functio that is automatically called when an instance of a script is created<br>

<br>

##### signal

a way to send notifications from one node to others, it can be used to trigger actions<br>
it's like an event in Solidity<br>

ex. of use cases fo signals:
`button pressed, animation has finished, collision happened, etc`

<br>

##### ex. of creating a signal:

```py
signal my_signal # defines the signal

func my_function():
    # Some code...
    my_signal.emit() # my_signal is emitted when that function is called
```

in previous Godot version it was used like that (with emit_signal function instead of simple emit()):

```py
emit_signal("signal_name")
```

<br>

##### ex. of using the signal into another script:

```py
func _ready():
    # connecting the signal
    # in this case when the signal happens it calls _on_my_signal() function
    $MyNode.my_signal.connect(_on_my_signal)

func _on_my_signal():
    print("Signal received!")
```

<br>

##### ex. of signals with arguments:

```py
signal health_changed(old_value, new_value)

var health = 10

func take_damage(amount):
    var old_health = health
    health -= amount
    health_changed.emit(old_health, health) # health_changed signal is emitted with the old and new health values as arguments
```

<br>

##### built-in signals

godot has some built-in signals that are triggered when a specific action happens<br>
they can be accessed by clicking on the node and then clicking on the “node” section on the right side menu<br>
ex.:

- pressed: emitted when a button is pressed
- animation_finished: emitted when an animation finishes playing
- area_entered: emitted when another Area enters this area's space

##### hit

it's a generic signal to be defined on code how/when it will be emitted<br>

##### connect()

it's a built-in function used to link a signal with a function<br>
when the signal happens the linked function will be automatically called<br>
ex.:

```py
var button = get_node("Button")  # example instantiating a Button node
button.connect("pressed", Callable(self, "_on_Button_pressed"))  # connecting the button's "pressed" signal to our own function
```

in previous Godot version it was used like that (without the Callable() function)):

```py
button.connect("pressed", self, "_on_Button_pressed")
```

<br>

##### get_node()

it's used to access another node in your scene<br>
it throw an error if the node doesn't exist<br>
you can use `has_node()` to check if the node exist<br>
ex.:

```py
if has_node("Player"):
	var player = get_node("Player")
```

<br>
it's the same thing as using $

<br>

##### ex. of using get_node():

```py
var player = get_node("Player") # getting a node named Player that is a direct child of the current node
var health_bar = get_node("../UserInterface/HealthBar") # getting a node that’s one level up and children fo a UserInterface node
```

<br>

##### $

it's used to access another node in your scene, just like get_node()<br>
ex.:

```py
var my_node = $MyNode
```

those have the same effect:<br>

```py
var my_node = get_node("MyNode")
var my_node = $MyNode
```

<br>

##### @onready

used to initiliaze references to other nodes for using before \_ready() is called<br>
ex.:

```py
onready var sprite = $Sprite # initiliazes the $Sprite node
onready var sound = preload("res://sound/sound_effect.wav") # initializes a file
```

<br>

##### \_unhandled_input()

built-in function for event listeners for input events that haven’t been handled by other functions<br>
it allows to code responses for key presses, mouse clicks, touchscreen interactions, etc<br>

##### set_process()

allows to enable or disable the processing of a node, specifically the `_process(delta)`
`set_process(true)` enables `_process(delta)` to run every frame
`set_process(false)` disables `_process(delta)` to run every frame

<br>

##### is_processing()

checks if `_process(delta)` is set to run or not<br>

##### is_instance_valid

checks if a node instance still is valid. <br>
it's useful to check if a node was deleted or not. <br>

##### visible

it’s a property present in some nodes, that determines the visibility of the node<br>
if visible is set to true, the node and its children will be visible in the game<br>
if visible is set to false, the node and its children will not be rendered in the game<br>
ex.:

```py
var character = get_node("CharacterSprite")
character.visible = false
```

<br>

##### @export

key word used to exposed variables to the inspector section in the editor<br>
ex.:

```py
@export var speed = 400
```

<br>

##### clamp()

it restricts a value to be within a certain value<br>
it takes 3 arguments:

- the value to clamp
- the minimum value
- the maximum value
  ex.:

```py
position.x = clamp(position.x, 0, screen_size.x) # clamping a position.x to be only until the screen maximum size
```

##### Collision tab

on this tab you define how different objects interact when they come into contact with each other<br>
there are 2 options there:<br>

- layer: defines what groups that object belongs to
- mask: defines what groups that object should interact with

##### Time

provides access to various time-related variables and methods<br>

##### Path2D

represents a path or trajectory in 2D space<br>
it's used to define a route path for other nodes to follow<br>

##### CanvasLayer

used to control the rendering order of 2D elements<br>
it's often used to make sure that menus are always visible on top of the game view<br>

##### Groups

a way to organize and categorize nodes, allowing operations to be performed on multiple nodes at once<br>

##### call_group()

it calls a function on every node in a group<br>
ex.:

```py
call_group("mobs", "queue_free") # it calls queue_free() function on all nodes from a group called “mobs”
```

<br>

#### Node2D

base class for organizing and transforming 2D objects.<br>

#### CharacterBody2D

used for implementing controlled movement and physics interactions of 2D objects<br>
it’s a sub class of Node2D<br>
ex. of usecases:<br>
`precise movement controls, collision handling, physics-based interactions`

<br>
<br>

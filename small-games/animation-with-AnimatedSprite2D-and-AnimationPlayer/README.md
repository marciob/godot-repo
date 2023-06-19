# 2D sprite animation assets

Used by the "2D sprite animation" tutorial: <br>

https://docs.godotengine.org/en/latest/tutorials/2d/2d_sprite_animation.html

## Godot 4 2D Animation Tutorial

This project showcases three different ways of creating 2D animations in Godot 4 using either individual images or sprite sheets. <br>

## Individual Images with AnimatedSprite2D

This method involves having a collection of separated images, each containing one frame of your character's animation. <br>

These images are added directly to an AnimatedSprite2D node, which controls the frame rate and sequence of the animation. The animation can be played and stopped by using the play() and stop() methods in the script. <br>

(image.png)
<br>

## Sprite Sheet with AnimatedSprite2D

This method uses a single sprite sheet with all the animation frames in one single image.<br>

The sprite sheet is added to an AnimatedSprite2D node, and the frames are selected in the SpriteFrames editor within Godot.<br>

This way, you can animate your character by sequencing through the frames in the sprite sheet, just as with individual images. <br>

(image-1.png)

## Sprite Sheet with AnimationPlayer

The third method is more complex and it involves using an AnimationPlayer node to animate a sprite sheet. <br>

Instead of using an AnimatedSprite2D node, you use a standard Sprite2D node to display the sprite sheet, and then animate the change from frame to frame using the AnimationPlayer. This method provides more control over the timing and sequencing of the animation frames. <br>
(image-2.png)

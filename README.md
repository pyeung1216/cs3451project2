# cs3451project2
Computer Graphics Project 2: Scene Animations

http://www.cc.gatech.edu/~turk/cs3451_2014_spring/hw2/hw2.html

Overview

The goal of this assignment is to create an animated scene using the 3D graphics library from Processing. Your code should run fast enough on a PC for you to have images generated at several frames per second. This is also the most open-ended assignment of the class, and it is an opportunity to be creative.

Objectives

You will write a program that, when executed, will draw a series of images that make up a short animation. You will use the 3D drawing routines of Processing that are accelerated by OpenGL to do all of the drawing.
Your images will contain several objects of your own choosing. These objects can be created in either of two ways. First, you can write special-purpose code to draw objects such as a cones, half-spheres, or whatever else you want. Second, it is fine for you to use models that you read in from a file. We do not care where these model files come from so long as you are not violating any copyright laws. The purpose of this assignment is to piece together and animate a scene containing several objects, and we do not want this assignment to be difficult in terms of creating the objects. Note that Processing provides "box" and "sphere" routines, and we give you example code that you can use for making cylinders. You can build many things out of these three basic shapes!

Here are the items that must be demonstrated by your program:

Camera motion

Your program should create a sequence of images of the scene during which the position of the virtual camera changes smoothly. You may wish to use linear interpolation of camera parameters to achieve this, but any technique to smoothly change the camera position is fine.

Object animation

At least one of the objects in the scene should be moving relative to the other objects in the scene. For example, a person could walk past a row of houses. Be sure that there are enough landmarks in your scene so that it is obvious that an object is moving as opposed to apparent motion due to the viewpoint changing.

Object instancing

At least one of the objects that you create should be replicated using instancing so that it appears in more than one location in the scene. You must not use duplicate lines of code to achieve this, but rather you must use the matrix stack and procedural encapsulation to accomplish this. Your object should be composed of several sub-parts. Just placing a sphere in several places doesn't count. Examples of objects that you might create are a mountain, a house, a person, a chair. Place a comment at the very start of your program that explicitly states which object you are replicating using instancing.

Object contact

Your scene must include one object with a flat side and another object that exactly touches this flat side. For instance, you might have a bicycle resting on a ground plane or a picture frame that is on a wall. Place a comment at the start of your program that explicitly states which object is resting against the flat side of which other object.

Duration

Your animation should create more than 500 frames of images. Please create an animation that finishes in a reasonable amount of time on your computer.

Lighting and shading

You must create at least one light source in your scene. The surfaces of the scene should be illuminated by the light sources. Do not use ambient lighting alone.

Perspective projection

You program must use perspective projection.

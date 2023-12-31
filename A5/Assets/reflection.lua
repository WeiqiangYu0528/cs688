mat1  = gr.material({0.7, 0.6, 1.0}, {0.7, 0.6, 1.0}, {0.5, 0.4, 0.8}, 25)	
mat2  = gr.material({1.0, 0.6, 0.1}, {1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 25)

mirror = gr.material( {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {1.0, 1.0, 1.0}, 25)
white = gr.material({0.9, 0.9, 0.9}, {0.9, 0.9, 0.9}, {0.5, 0.5, 0.5}, 25)
red = gr.material({1, 1, 1}, {0.45, 0.15, 0.2}, {0.25, 0.25, 0.25}, 25)
blue = gr.material({1, 1, 1}, {0.15, 0.15, 0.5}, {0.25, 0.25, 0.25}, 25)
grey= gr.material({1, 1, 1}, {0.5, 0.5, 0.5}, {0.25, 0.25, 0.25}, 25)

scene = gr.node('scene')

reflectiveSphere = gr.sphere('reflective')
reflectiveSphere:scale(2, 2, 2)
reflectiveSphere:translate(-6, 8, -3)
reflectiveSphere:set_material(mirror)
reflectiveSphere:set_reflection(1.0, 0.25)
scene:add_child(reflectiveSphere)

box = gr.cube('box')
box:scale(3, 3, 3)
box:translate(-5, -8.75, -15)
box:set_material(mat1)
scene:add_child(box)

sphere = gr.sphere('sphere')
sphere:translate(-1, -1, -15)
sphere:set_material(mat2)
scene:add_child(sphere)

floor = gr.cube('floor')
floor:scale(40, 1, 50)
floor:translate(-25, -10, -30)
scene:add_child(floor)
floor:set_material(grey)

backwall = gr.cube('backwall')
backwall:scale(40, 40, 1)
backwall:translate(-20, -15, -40)
backwall:set_material(grey)
scene:add_child(backwall)

leftwall = gr.cube('leftwall')
leftwall:scale(1, 40, 50)
leftwall:translate(-15, -15, -30)
leftwall:set_material(red)
scene:add_child(leftwall)

rightwall = gr.cube('rightwall')
rightwall:scale(1, 40, 50)
rightwall:translate(15, -15, -30)
rightwall:set_material(blue)
scene:add_child(rightwall)

ceiling = gr.cube('ceiling')
ceiling:scale(40, 1, 50)
ceiling:translate(-25, 18, -30)
ceiling:set_material(grey)
scene:add_child(ceiling)

white_light = gr.light({2, 5, 20}, {0.25, 0, 0}, {0, 0.25, 0}, {0, 0, 0.25}, 2, 2, 2, {1, 1, 1}, {1, 0, 0})
lightpanel = gr.nh_rect('lightpanel', {2, 5, 20}, {0.5, 0.5, 0.5})
lightpanel:set_material(white)
lightpanel:set_illumination(white_light)
scene:add_child(lightpanel)

gr.render(scene, 'reflection.png', 512, 512,
	  {0, 5, 20}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {white_light})

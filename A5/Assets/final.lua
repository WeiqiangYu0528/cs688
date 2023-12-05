-- A simple scene with some miscellaneous geometry.
mat1  = gr.material({0.7, 0.6, 1.0}, {0.7, 0.6, 1.0}, {0.5, 0.4, 0.8}, 25)	
mat2  = gr.material({1.0, 0.6, 0.1}, {1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 250)

mirror1 = gr.material( {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {1.0, 1.0, 1.0}, 25)
mirror2 = gr.material( {0.0, 0.0, 0.0}, {0.0, 0.0, 0.0}, {1.0, 1.0, 1.0}, 25)
glass1 = gr.material({0.05, 0.05, 0.05}, {0.05, 0.05, 0.05}, {0.7, 0.7, 0.7},  25)
glass2 = gr.material({0.05, 0.05, 0.05}, {0.05, 0.05, 0.05}, {0.7, 0.7, 0.7},  25)

brown = gr.material({0.25, 0.25, 0.25}, {0.58, 0.41, 0.32}, {0.5, 0.4, 0.8}, 25)
white = gr.material({0.9, 0.9, 0.9}, {0.9, 0.9, 0.9}, {0.5, 0.5, 0.5}, 25)
red = gr.material({0.44, 0.137, 0.1886}, {0.44, 0.137, 0.1886}, {0.3, 0.05, 0.05}, 25)
blue = gr.material({0.1386, 0.1327, 0.45}, {0.1386, 0.1327, 0.45}, {0.1, 0.05, 0.5}, 25)
grey1 = gr.material({0.25, 0.25, 0.25}, {0.4649, 0.4823, 0.5002}, {0.3, 0.3, 0.3}, 25)
grey2 = gr.material({0.25, 0.25, 0.25}, {0.4649, 0.4823, 0.5002}, {0.3, 0.3, 0.3}, 25)

water = gr.material({0.1, 0.1, 0.1}, {0.678, 0.847, 0.902}, {0.1, 0.1, 0.1}, 25)
boatTexture = gr.material( {0.75, 0.75, 0.75}, {1, 1, 1}, {0.25, 0.25, 0.25}, 25)
imageTexture = gr.material({1, 1, 1}, {0.25, 0.25, 0.25}, {0.25, 0.25, 0.25}, 25)
eeveeTexture = gr.material({1, 1, 1}, {0.25, 0.25, 0.25}, {0.25, 0.25, 0.25}, 25)
stoneTexture = gr.material({1, 1, 1}, {0, 0, 0}, {0.25, 0.25, 0.25}, 25)
deskTexture = gr.material({0.1, 0.1, 0.1}, {0.6, 0.6, 0.6}, {0.35, 0.35, 0.35}, 25)
verticalPerlinTexture = gr.material({0, 0, 0.5}, {1.0, 0.6, 0.1}, {0, 0, 0}, 1)
horizontalPerlinTexture = gr.material({1, 0, 0}, {1.0, 0.6, 0.1}, {0, 0, 0}, 1)
kuribo_mat = gr.material( {0.25, 0.25, 0.25}, {0, 0, 0}, {0.25, 0.25, 0.25}, 25)

scene = gr.node('root')

backwall = gr.plane('backwall')
backwall:rotate('x', 90)
backwall:scale(200, 250, 1)
backwall:translate(-40, 200, -12.5)
backwall:set_material(grey2)
backwall:set_image("wall.png")
scene:add_child(backwall)

floor = gr.plane('floor')
floor:scale(200, 1, 350)
floor:translate(-40, 0, -60)
floor:set_material(grey2)
scene:add_child(floor)

leftwall = gr.plane("leftwall")
leftwall:rotate('z', -90)
leftwall:scale(1, 300, 350)
leftwall:translate(-35, 250, -50)
leftwall:set_material(grey2)
scene:add_child(leftwall)

rightwall = gr.plane('rightwall')
rightwall:rotate('z', 90)
rightwall:scale(1, 300, 300)
rightwall:translate(160, -25, -13.5)
rightwall:set_material(grey2)
scene:add_child(rightwall)

ceiling = gr.plane('ceiling')
ceiling:rotate('x', 180)
ceiling:scale(300, 1, 300)
ceiling:translate(-75, 200, 250)
ceiling:set_material(grey2)
scene:add_child(ceiling)

frontwall = gr.plane('frontwall')
frontwall:rotate('x', -90)
frontwall:scale(300, 250, 1)
frontwall:translate(-100, -50, 230)
frontwall:set_material(grey2)
scene:add_child(frontwall)

-- boat = gr.mesh('all', 'all.obj')
-- boat:rotate("y", -90)
-- boat:scale(12, 12, 12)
-- boat:translate(62, 0, 70)
-- boat:set_material(boatTexture)
-- boat:set_image()
-- scene:add_child(boat)

-- reflective_sphere = gr.sphere('sphere1')
-- reflective_sphere:scale(10, 10, 10)
-- reflective_sphere:translate(5, 92, 20)
-- reflective_sphere:set_material(mirror1)
-- reflective_sphere:set_reflection(1, 0)
-- scene:add_child(reflective_sphere)

-- transparent_sphere = gr.sphere('sphere2')
-- transparent_sphere:scale(10, 10, 10)
-- transparent_sphere:translate(45, 92, 20)
-- transparent_sphere:set_material(glass1)
-- transparent_sphere:set_refraction(1, 1.5, 0)
-- transparent_sphere:set_reflection(1, 0)
-- scene:add_child(transparent_sphere)

-- glossy_trans_sphere = gr.sphere('sphere3')
-- glossy_trans_sphere:scale(10, 10, 10)
-- glossy_trans_sphere:translate(85, 92, 20)
-- glossy_trans_sphere:set_material(glass2)
-- glossy_trans_sphere:set_refraction(1, 1.5, 0.025)
-- glossy_trans_sphere:set_reflection(1, 0)
-- scene:add_child(glossy_trans_sphere)

-- glossy_reflective_sphere = gr.sphere('sphere4')
-- glossy_reflective_sphere:scale(10, 10, 10)
-- glossy_reflective_sphere:translate(125, 92, 20)
-- glossy_reflective_sphere:set_material(mirror2)
-- glossy_reflective_sphere:set_reflection(1, 0.125)
-- scene:add_child(glossy_reflective_sphere)

-- rope1 = gr.mesh('rope', 'rope.obj')
-- rope1:scale(20, 13, 20)
-- rope1:translate(45, 140, 20)
-- rope1:set_material(brown)
-- scene:add_child(rope1)

-- rope2 = gr.mesh('rope', 'rope.obj')
-- rope2:scale(20, 13, 20)
-- rope2:translate(5, 140, 20)
-- rope2:set_material(brown)
-- scene:add_child(rope2)

-- rope3 = gr.mesh('rope', 'rope.obj')
-- rope3:scale(20, 13, 20)
-- rope3:translate(85, 140, 20)
-- rope3:set_material(brown)
-- scene:add_child(rope3)

-- rope4 = gr.mesh('rope', 'rope.obj')
-- rope4:scale(20, 13, 20)
-- rope4:translate(125, 140, 20)
-- rope4:set_material(brown)
-- scene:add_child(rope4)


-- kuribo = gr.mesh('kuribo', 'Kuribo.obj')
-- kuribo:scale(2, 2, 2)
-- kuribo:translate(72, 6.5, 69)
-- kuribo:set_material(kuribo_mat)
-- kuribo:set_image()
-- scene:add_child(kuribo)

-- cylinder = gr.cylinder('cylinder')
-- cylinder:scale(3.5, 5, 3.5)
-- cylinder:translate(38, 14, 67)
-- cylinder:set_material(verticalPerlinTexture)
-- cylinder:set_perlin(1, 1)
-- scene:add_child(cylinder)

-- cone = gr.cone("cone")
-- cone:scale(5.5, 10, 5.5)
-- cone:translate(50, 18, 70)
-- cone:set_material(horizontalPerlinTexture)
-- cone:set_perlin(1, 0)
-- scene:add_child(cone)

-- nemo = gr.mesh("nemo", "nemo.obj")
-- nemo:scale(6, 6, 6)
-- nemo:translate(44.6, 92, 13)
-- nemo:set_material(imageTexture)
-- nemo:set_image()
-- scene:add_child(nemo)

-- Eevee = gr.mesh('Eevee', 'Eevee.obj')
-- Eevee:scale(4, 4, 4)
-- Eevee:translate(86.2, 92, 12.5)
-- Eevee:set_material(eeveeTexture)
-- Eevee:set_image()
-- scene:add_child(Eevee)

white_light = gr.light({20, 80, 30}, {1, 0, 0}, {0, 1, 0}, {0, 0, 1}, 15, 15, 15, {256, 256, 256}, {1, 0, 0})

lightpanel = gr.nh_box('lightpanel', {20, 80, 30}, 15)
lightpanel:set_material(white)
lightpanel:set_illumination(white_light)
scene:add_child(lightpanel)

gr.render(scene, 'final.png', 512, 512,
	  {60, 50, 200}, {0, 0, -1}, {0, 1, 0}, 50,
	  {1, 1, 1}, {white_light})

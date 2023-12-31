
red = gr.material({0.94, 0.14, 0.235}, {0.1, 0.1, 0.1}, 10)
darkRed = gr.material({0.1, 0.0, 0.0}, {0.1, 0.1, 0.1}, 10)
blue = gr.material({0.016, 0.424, 0.549}, {0.1, 0.1, 0.1}, 10)
green = gr.material({0.584, 0.969, 0.878}, {0.1, 0.1, 0.1}, 10)
white = gr.material({1.0, 1.0, 1.0}, {0.1, 0.1, 0.1}, 10)
yellow = gr.material({1.0, 0.835, 0.0}, {0.1, 0.1, 0.1}, 10)
black = gr.material({0.0, 0.0, 0.0}, {0.1, 0.1, 0.1}, 10)
white = gr.material({1.0, 1.0, 1.0}, {0.1, 0.1, 0.1}, 10)
orange = gr.material({1.0, 0.514, 0.008}, {0.1, 0.1, 0.1}, 10)
purple = gr.material({0.46, 0.47, 0.93}, {0.1, 0.1, 0.1}, 10)
coral = gr.material({0.95, 0.36, 0.33}, {0.1, 0.1, 0.1}, 10)

-- Create the top level root node named 'root'.
rootNode = gr.node('rootNode')
rootNode:translate(0.0, 0.0, -8.0)

function drawTorso()
    torso = gr.mesh('sphere', 'my_torso')
    torso:scale(0.8, 1.0, 0.5)
    torso:set_material(white)
    rootNode:add_child(torso)
end

function drawShoulder()
    shoulderJoint = gr.joint('shoulderJoint', {0, 0, 0}, {-30, 0, 30})
    shoulderJoint:translate(0.0, 1.0, 0.0)

    shoulders = gr.mesh('sphere', 'my_shoulders')
    shoulders:scale(1.0, 0.2, 0.3)
    shoulders:set_material(yellow)

    shoulderJoint:add_child(shoulders)
    rootNode:add_child(shoulderJoint)
end


function drawHip()
    hipJoint = gr.joint('hipJoint', {0, 0, 0}, {-30, 0, 30})
    hipJoint:translate(0.0, -1.0, -0.0)

    hips = gr.mesh('sphere', 'my_hips')
    hips:scale(0.8, 0.2, 0.3)
    hips:set_material(yellow)

    hipJoint:add_child(hips)
    rootNode:add_child(hipJoint)
end

function drawUpperArms()
    leftUpperArmJoint = gr.joint('leftUpperArmJoint', {-45, 0, 45}, {0, 0, 0})
    leftUpperArm = gr.mesh('sphere', 'my_left_upper_arm')

    rightUpperArmJoint = gr.joint('rightUpperArmJoint', {-45, 0, 45}, {0, 0, 0})
    rightUpperArm = gr.mesh('sphere', 'my_right_upper_arm')

    leftUpperArmJoint:translate(-0.9, 0.0, 0.0)
    rightUpperArmJoint:translate(0.9, 0.0, 0.0)
    
    leftUpperArm:translate(0.0, -1.0, 0.0)
    rightUpperArm:translate(0.0, -1.0, 0.0)
    leftUpperArm:set_material(orange)
    rightUpperArm:set_material(orange)

    leftUpperArm:scale(0.1, 0.5, 0.1)
    rightUpperArm:scale(0.1, 0.5, 0.1)

    shoulderJoint:add_child(leftUpperArmJoint)
    shoulderJoint:add_child(rightUpperArmJoint)

    leftUpperArmJoint:add_child(leftUpperArm)
    rightUpperArmJoint:add_child(rightUpperArm)
end

function drawForearm()
    leftForearmJoint = gr.joint('leftForearmJoint', {-45, 0, 45}, {0, 0, 0})
    leftForearm = gr.mesh('sphere', 'my_left_forearm')

    rightForearmJoint = gr.joint('rightForearmJoint', {-45, 0, 45}, {0, 0, 0})
    rightForearm = gr.mesh('sphere', 'my_right_forearm')

    leftForearmJoint:translate(0.0, -1.0, 0.0)
    rightForearmJoint:translate(0.0, -1.0, 0.0)

    leftForearm:translate(0.0, -1.0, 0.0)
    rightForearm:translate(0.0, -1.0, 0.0)
    leftForearm:set_material(coral)
    rightForearm:set_material(coral)

    leftForearm:scale(0.06, 0.5, 0.03)
    rightForearm:scale(0.06, 0.5, 0.03)

    leftUpperArmJoint:add_child(leftForearmJoint)
    rightUpperArmJoint:add_child(rightForearmJoint)

    leftForearmJoint:add_child(leftForearm)
    rightForearmJoint:add_child(rightForearm)
end

function drawHand(left)
    leftHandJoint = gr.joint('leftHandJoint', {-45, 0, 45}, {0, 0, 0})
    leftHand = gr.mesh('sphere', 'my_left_hand')

    rightHandJoint = gr.joint('rightHandJoint', {-45, 0, 45}, {0, 0, 0})
    rightHand = gr.mesh('sphere', 'my_right_hand')

    leftHandJoint:translate(0.0, -1.0, 0.0)
    rightHandJoint:translate(0.0, -1.0, 0.0)

    leftHand:scale(0.1, 0.2, 0.1)
    rightHand:scale(0.1, 0.2, 0.1)
    leftHand:translate(0.0, -0.1, 0.0)
    rightHand:translate(0.0, -0.1, 0.0)
    leftHand:set_material(green)
    rightHand:set_material(green)

    leftForearmJoint:add_child(leftHandJoint)
    rightForearmJoint:add_child(rightHandJoint)

    leftHandJoint:add_child(leftHand)
    rightHandJoint:add_child(rightHand)
end

function drawThigh(left)
    leftThighJoint = gr.joint('leftThighJoint', {-45, 0, 45}, {0, 0, 0})
    leftThigh = gr.mesh('sphere', 'my_left_thigh')

    rightThighJoint = gr.joint('rightThighJoint', {-45, 0, 45}, {0, 0, 0})
    rightThigh = gr.mesh('sphere', 'my_right_thigh')

    leftThighJoint:translate(-0.7, 0.0, 0.0)
    rightThighJoint:translate(0.7, 0.0, 0.0)    

    leftThigh:scale(0.1, 0.5, 0.1)
    rightThigh:scale(0.1, 0.5, 0.1)
    leftThigh:set_material(purple)
    rightThigh:set_material(purple)

    leftThigh:translate(0.0, -0.5, 0.0)
    rightThigh:translate(0.0, -0.5, 0.0)

    hipJoint:add_child(leftThighJoint)
    hipJoint:add_child(rightThighJoint)

    leftThighJoint:add_child(leftThigh)
    rightThighJoint:add_child(rightThigh)
end

function drawCalf(left)
    leftCalfJoint = gr.joint('leftCalfJoint', {-45, 0, 45}, {0, 0, 0})
    leftCalf = gr.mesh('sphere', 'my_left_calf')

    rightCalfJoint = gr.joint('rightCalfJoint', {-45, 0, 45}, {0, 0, 0})
    rightCalf = gr.mesh('sphere', 'my_right_calf')

    leftCalfJoint:translate(0.0, -1.0, 0.0)
    rightCalfJoint:translate(0.0, -1.0, 0.0)

    leftCalf:scale(0.1, 0.4, 0.1)
    rightCalf:scale(0.1, 0.4, 0.1)

    leftCalf:translate(0.0, -0.4, 0.0)
    rightCalf:translate(0.0, -0.4, 0.0)
    leftCalf:set_material(blue)
    rightCalf:set_material(blue)

    leftThighJoint:add_child(leftCalfJoint)
    rightThighJoint:add_child(rightCalfJoint)

    leftCalfJoint:add_child(leftCalf)
    rightCalfJoint:add_child(rightCalf)
end

function drawFoot(left)
    leftFootJoint = gr.joint('leftFootJoint', {-45, 0, 45}, {0, 0, 0})
    leftFoot = gr.mesh('sphere', 'my_left_foot')

    rightFootJoint = gr.joint('rightFootJoint', {-45, 0, 45}, {0, 0, 0})
    rightFoot = gr.mesh('sphere', 'my_right_foot')

    leftFootJoint:translate(0.0, -0.8, 0.0)
    rightFootJoint:translate(0.0, -0.8, 0.0)

    leftFoot:scale(0.12, 0.15, 0.1)
    rightFoot:scale(0.12, 0.15, 0.1)
    leftFoot:translate(0.0, -0.1, 0.0)
    rightFoot:translate(0.0, -0.1, 0.0)
    leftFoot:set_material(green)
    rightFoot:set_material(green)

    leftCalfJoint:add_child(leftFootJoint)
    rightCalfJoint:add_child(rightFootJoint)

    leftFootJoint:add_child(leftFoot)
    rightFootJoint:add_child(rightFoot)
end

function drawNeck()
    neckJoint = gr.joint('neckJoint', {-10, 0, 30}, {0, 0, 0})
    neckJoint:translate(0.0, 1.4, 0.0)

    neck = gr.mesh('sphere', 'my_neck')
    neck:scale(0.25, 0.3, 0.25)
    neck:set_material(red)

    neckJoint:add_child(neck)
    rootNode:add_child(neckJoint)
end

function drawHead()
    headJoint = gr.joint('headJoint', {0, 0, 0}, {-90, 0, 90})
    headJoint:translate(0.0, 0.58, 0.0)

    head= gr.mesh('sphere', 'my_head')
    head:scale(0.5, 0.5, 0.5)
    head:set_material(white)

    headJoint:add_child(head)
    neckJoint:add_child(headJoint)
end

function drawEyes()

    leftEye = gr.mesh('sphere', 'my_left_eye')
    rightEye = gr.mesh('sphere', 'my_right_eye')

    leftEye:scale(0.1, 0.1, 0.1)
    leftEye:translate(-0.2, 0.0, 0.5)
    leftEye:set_material(black)

    rightEye:scale(0.1, 0.1, 0.1)
    rightEye:translate(0.2, 0.0, 0.5)
    rightEye:set_material(black)

    headJoint:add_child(leftEye)
    headJoint:add_child(rightEye)
end

drawTorso()
drawShoulder()
drawHip()
drawUpperArms()
drawForearm()
drawHand()
drawThigh()
drawCalf()
drawFoot()
drawNeck()
drawHead()
drawEyes()

return rootNode

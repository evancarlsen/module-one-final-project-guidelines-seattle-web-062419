# comment
Rover.destroy_all
Camera.destroy_all
RoverCamera.destroy_all


r1 = Rover.create(name: "Rover 1")
r2 = Rover.create(name: "Rover 2")

c1 = Camera.create(name: "Camera 1")
c2 = Camera.create(name: "Camera 2")

# todo: try to pass in just the instances once asosciations are set up
# rc1 = RoverCamera.create(rover: r1, camera: c1)
# rc2 = RoverCamera.create(rover: r2, camera: c2)

rc1 = RoverCamera.create(rover_id: r1.id, camera_id: c1.id)
rc2 = RoverCamera.create(rover_id: r2.id, camera_id: c2.id)
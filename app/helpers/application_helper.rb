module ApplicationHelper

  def randomized_background_image
    images =
      ["backgrounds/bg1.jpg", "backgrounds/bg2.jpg", "backgrounds/bg3.jpg", "backgrounds/bg4.jpg",
       "backgrounds/bg5.jpg", "backgrounds/bg6.jpg", "backgrounds/bg7.jpg", "backgrounds/bg8.jpg",
       "backgrounds/bg9.jpg", "backgrounds/bg10.jpg", "backgrounds/bg11.jpg", "backgrounds/bg12.jpg",
       "backgrounds/bg13.jpg", "backgrounds/bg14.jpg"]
    images[rand(images.size)]
  end

end

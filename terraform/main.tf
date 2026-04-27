# 1. Pull the image from your Docker Hub
resource "docker_image" "nawy_app" {
  # Replace 'your-username' with your actual Docker Hub username
  name         = "${var.docker_username}/nawy-app:latest"
  keep_locally = false
}

# 2. Create and start the container
resource "docker_container" "nawy_app_container" {
  image = docker_image.nawy_app.name
  name  = "nawy-production-container"

  ports {
    internal = 3000
    external = 8080 # We'll map it to 8080 to avoid conflicts with 3000
  }
  
  # Restart policy for "production" feel
  restart = "always"
}
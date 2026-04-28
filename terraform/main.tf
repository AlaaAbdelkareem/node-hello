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
  
  # Inject the New Relic configuration
  env = [
    "NEW_RELIC_LICENSE_KEY=${var.new_relic_key}",
    "NEW_RELIC_APP_NAME=Nawy-Node-App",
    "NEW_RELIC_LOGGING_ENABLED=true",
    "NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true"
  ]

  ports {
    internal = 3000
    external = 8080 # We'll map it to 8080 to avoid conflicts with 3000
  }
  
  # Restart policy for "production" feel
  restart = "always"
}
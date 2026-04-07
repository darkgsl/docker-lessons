variable "BLD_RELEASE" {
  default = "v1.1"
}

group "default" {
  targets = ["lesson5"]
}

target "lesson5" {
  context = "."
  dockerfile = "Dockerfile"
  args = {
    BLD_RELEASE = "${BLD_RELEASE}"
    NGINX_VERSION="1.28.3-r0"
  }
  tags = ["lesson5:${BLD_RELEASE}"]
}
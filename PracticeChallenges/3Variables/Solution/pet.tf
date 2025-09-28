
# Using objects.

variable "my-pet" {
  type = object({
    name        = string
    color       = string
    age         = number
    food        = list(string)
    is_favorite = bool
  })

  default = {
    name        = "matrix"
    color       = "brown"
    age         = 3
    food        = ["kibble", "treats", "chicken"]
    is_favorite = true
  }
}


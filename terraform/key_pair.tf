resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLl2gZN5+TvvYh5RAIqApEbN7C2Q72wVb/qgjZdQCOhgqFDaDUBxw8yCHD316QpXy1V4ZDM1uLlDlRfBmnx+C0VDvIib1LbdR6DnhKgsJqFX4qQwpqSsJHndzp4133cGbyfEEUNGmUPF4SzYDqGcwLEl06Zd8e6OOKY2cvmolHv20OI+/kBXizXe9IzmS9t1H2ZBjP0OSm69sUO/QAA9k8sx/HsLCqt2D9YNZ8BbPnblVPY4jZH9B+0Y6A1Pbb/cnCSqMQeOwaxxeyATNCYxzlFTJh2Y4unDgRzaSouKb6nwn7HHTpwFlIkjxrITG3VHdTerM0DiNj2VGgrc/C10sZEm+s7bQBUTZvaH9S0zdvybf1JdKqMV3EThyHzNJeMwq1U1Kn+qwNhWj+pFGWt6FxvEYAk3yQpgm6YzbDIWPN6JRT8m996DO+JNQFe4l31VaqCLqA4UTb+udrVJ/zLPJDNDP0C9TStfbXZ7XMAlPsRU03Y9kRPdMSU9EEThvMc98= ubuntu@ip-172-31-10-230"
}
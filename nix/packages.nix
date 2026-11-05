{ pkgs }:

with pkgs; [
  # Go toolchain
  go

  # Kubernetes & local development tooling
  k3d
  kubectl
  kubernetes-helm
  tilt
  skaffold
]
++ lib.optionals stdenv.isLinux [
  # Native k3s package is only supported on Linux
  k3s
]

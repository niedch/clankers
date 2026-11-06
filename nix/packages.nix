{ pkgs }:

with pkgs; [
  # Go toolchain
  go

  # Kubernetes & local development tooling
  kind
  kubectl
  kubernetes-helm
  tilt
]

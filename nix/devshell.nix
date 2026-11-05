{ pkgs }:

let
  packages = import ./packages.nix { inherit pkgs; };
in
pkgs.mkShell {
  packages = packages;

  shellHook = ''
    if command -v k3d >/dev/null 2>&1; then
      K3D_CFG="$(k3d kubeconfig write my-dev-cluster 2>/dev/null || true)"
      if [ -n "$K3D_CFG" ]; then
        export KUBECONFIG="$K3D_CFG"
        echo "Kubernetes-Kontext auf 'k3d-my-dev-cluster' gesetzt."
      fi
    fi
  '';
}

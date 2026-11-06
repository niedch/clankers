{ pkgs }:

let
  packages = import ./packages.nix { inherit pkgs; };
in
pkgs.mkShell {
  packages = packages;

  shellHook = ''
    if command -v kind >/dev/null 2>&1; then
      if kind get clusters 2>/dev/null | grep -qx "my-dev-cluster"; then
        if kind export kubeconfig --name my-dev-cluster >/dev/null 2>&1; then
          command -v kubectl >/dev/null 2>&1 && kubectl config use-context kind-my-dev-cluster >/dev/null 2>&1 || true
          echo "K8s-Context set to 'kind-my-dev-cluster'"
        fi
      fi
    fi
  '';
}

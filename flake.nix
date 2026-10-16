{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      llvm = pkgs.llvmPackages_23;
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      devShells.${system}.default =
        (pkgs.mkShell.override {
          stdenv = llvm.stdenv;
        })
          {
            packages = with pkgs; [
              meson
              ninja
              cmake
              pkg-config
              git

              llvm.clang-tools

              shader-slang
              spirv-tools
              vulkan-tools
            ];

            buildInputs = with pkgs; [
              vulkan-headers
              vulkan-loader
              vulkan-validation-layers

              # GLFW's Wayland dependencies
              wayland
              wayland-protocols
              libxkbcommon
            ];

            shellHook = ''
              export VK_ADD_LAYER_PATH="${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d''${VK_ADD_LAYER_PATH:+:$VK_ADD_LAYER_PATH}"
              export LD_LIBRARY_PATH="${pkgs.vulkan-loader}/lib''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
            '';
          };
    };
}

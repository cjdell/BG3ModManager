{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell (let
  lslib = pkgs.fetchzip  {
    name = "ExportTool-v1.18.7.zip";
    url =
      "https://github.com/Norbyte/lslib/releases/download/v1.18.7/ExportTool-v1.18.7.zip";
    sha256 = "sha256-a8sHW3WshqoonKeviA3aisYzaUipfWsyz4nE2drcQ+U=";
  };

in {
  # buildInputs is for dependencies you'd need "at run time",
  # were you to to use nix-build not nix-shell and build whatever you were working on

  buildInputs = with pkgs; [ dotnet-sdk_8 ];

  shellHook = ''
    export PS1="$PS1[.NET]$ "

    mkdir -p External/lslib
    chmod -R ug+w External
    cp -a ${lslib}/* External/lslib 
  '';
})

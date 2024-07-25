# nixos pi5

## usage
this pi us used as a home server to host various services, borg repos and such.

currently there are five services running on it:

### as docker
- immich
- stirling-pdf

### as nix-module
- borg
- freshrss
- nextcloud

## structure

```
pi@nixpi ~/nixos (main)> tree .
.
├── flake.lock
├── flake.nix
├── home
│   ├── default.nix
│   └── docker
│       ├── immich.nix
│       └── stirling-pdf.nix
├── hosts
│   └── pi
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── virtualisation.nix
└── services
    ├── borg.nix
    ├── default.nix
    ├── freshrss.nix
    └── nextcloud.nix
```

## boot process
the boot process of the pi5 seems to be closed, that way one needs to use
[another firmware](https://github.com/worproject/rpi5-uefi). there is a
comprehensive conversation about it that explains the whole process on the
following thread.

https://github.com/nixos/nixpkgs/issues/260754#issuecomment-1908664693

## hardware on the pi5 is a 1tb nvme m.2 mounted that is able to provide much
more speed than the sd-card is able to, that is helpful when putting backups
(with borg), immich and nextcloud on it, can recommend.

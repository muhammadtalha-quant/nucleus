# Nucleus Architecture

## Introduction

Nucleus Architecture is a lightweight approach to organizing declarative NixOS
configurations using flakes.

It is inspired by the dendritic pattern, while intentionally avoiding additional
configuration frameworks such as
[**hercules-ci/flake-parts**](https://github.com/hercules-ci/flake-parts),
[**denful/den**](https://github.com/denful/den), or
[**numtide/flake-utils**](https://github.com/numtide/flake-utils).

Nucleus focuses on keeping configurations modular and understandable by
separating reusable components from host-specific configuration.

It is my approach to structuring personal NixOS systems using native NixOS
concepts while maintaining a clear separation between shared configuration,
reusable features, and individual machines.

## Goals

Nucleus aims to provide:

- A predictable structure for personal NixOS configurations.
- Clear separation between shared configuration, reusable features, and
  host-specific details.
- A reproducible installation and migration workflow.
- A configuration layout that remains understandable over long periods of time.
- A practical starting point for users who want to build and maintain their own
  NixOS systems.

## Scope

Nucleus is designed for personal NixOS configurations.

It can comfortably support configurations with multiple machines, such as:

- personal laptops
- desktops
- home servers
- development machines

Nucleus can technically support many hosts, but it is optimized for personal
ownership rather than large-scale fleet management. Ideally, a setup with less
than 10 individual hosts should remain straightforward to maintain with this
architecture.

The architecture assumes that the person maintaining the configuration
understands the design decisions behind it. For larger teams or deployments
where many people manage many machines, dedicated infrastructure-oriented
frameworks may be more appropriate.

> [!CAUTION]
>
> - This architecture is strictly designed for personal NixOS configurations.
> - For production use, please default to
>   [**hercules-ci/flake-parts**](https://github.com/hercules-ci/flake-parts) or
>   [**denful/den**](https://github.com/denful/den).
> - Only **UEFI** systems are supported.

## Host Management Model

Nucleus follows a host-oriented configuration model.

The repository can contain multiple hosts, but each host is treated as an
individual system with its own requirements and configuration.

When adding a new host:

1. Start from the existing architecture.
2. Adapt features according to the needs of that machine.
3. Move host-specific configuration into the corresponding host directory.
4. Import and maintain the configuration for that host independently.

Nucleus does not aim to be a centralized fleet management system where every
machine is controlled from a single configuration repository.

While technically possible, managing a large number of hosts from one repository
requires additional processes and is outside the intended scope of this
architecture.

## Non-goals

Nucleus is intentionally not designed to:

- Replace general-purpose Nix configuration frameworks.
- Provide fleet management or infrastructure deployment features.
- Solve every possible NixOS configuration scenario.
- Become a universal standard for organizing NixOS systems.

Nucleus is designed specifically for personal NixOS configurations where
simplicity, ownership, and maintainability are the priority.

## Tech Stack

The nucleus architecture primarily uses flakes as the main foundation, with the
following flakes as core dependencies.

- _**import-tree:**_ used for recursively importing *.nix files
- _**home-manager:**_ used for declaratively configuring dotfiles in native nix.
- _**disko:**_ used to declaratively automate the formatting, partitioning and
  mounting of the target disk.
- _**nixpkgs:**_ uses rolling release instance of NixOS for building OS
  generation and programs included in package list.

## Tree Structure

> To be documented

### Core Concepts

Nucleus organizes configuration into three layers:

#### Common

Configuration shared by every machine.

Examples:

- disko layout for partitioning
- core nixos configuration for both servers and desktops.
- custom overlays and derivations shared across machines.

#### Features

Reusable system capabilities.

Examples:

- desktop environments
- services
- development tools
- applications

#### Hosts

Machine-specific configuration.

Examples:

- hardware configuration
- kernel modules
- drivers

## Getting Started

> To be documented

## Acknowledgments

- **Nucleus Architecture** made with Love++ and AI--.
- If you want to contribute, please read [CONTRIBUTING.md](./CONTRIBUTING.md)

## LICENSE

BSD 3-Clause License

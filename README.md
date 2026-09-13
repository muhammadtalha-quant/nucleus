# Nucleus Architecture

<!--toc:start-->
- [Nucleus Architecture](#nucleus-architecture)
  - [Introduction](#introduction)
  - [Goals](#goals)
  - [Scope](#scope)
  - [Acknowledgments](#acknowledgments)
  - [LICENSE](#license)
<!--toc:end-->

## Introduction

> [!NOTE]
> For full documentation of the project, please visit the [**Nucleus Wiki.**](https://github.com/muhammadtalha-quant/nucleus/wiki/Nucleus-Architecture)
Nucleus Architecture is a lightweight, abstraction-free and easy to debug
configuration architecture inspired by the dendritic pattern for
maintaining NixOS systems using some of the best practices encouraged by the ecosystem.

Nucleus focuses on keeping configurations modular and understandable by
separating reusable components from host-specific configuration.

## Goals

Nucleus aims to provide:

- A predictable structure for personal NixOS configurations.
- Clear separation between shared configuration, reusable features, and
  host-specific details.
- A reproducible installation and migration workflow.
- A configuration layout that remains understandable over long periods of time.
- A practical starting point for users who want to build and maintain their own
  NixOS systems using the best NixOS practices.

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

## Acknowledgments

- **Nucleus Architecture** made with Love++ and AI--.
- If you want to contribute, please read [CONTRIBUTING.md](./CONTRIBUTING.md)

## LICENSE

[BSD 3-Clause License](./LICENSE)

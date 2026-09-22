# Contributing to Nucleus

Thank you for your interest in contributing to Nucleus. This guide explains the contribution process and requirements.

## Requirements

- **NixOS system** (latest stable or unstable)
- Git
- Flakes enabled in Nix configuration
- Devenv installed
- Basic knowledge of Nix and NixOS

## Development Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/muhammadtalha-quant/nucleus.git
   cd nucleus
   ```

2. **Install Devenv and Enable Flakes**
   ```bash
   curl -fsSL https://get.devenv.sh | bash
   export NIX_CONFIG="experimental-features = flakes nix-command"
   ```

3. **Enter Development Environment**
   ```bash
   devenv shell
   ```

## Types of Contributions

### Reporting Bugs

1. Use the "Bug Report" issue template.
2. Include clear reproduction steps and your environment details.
3. Provide relevant configuration snippets and error logs.

### Submitting Features

1. Start a discussion or open a "Feature Request" issue.
2. Explain the motivation and expected behavior.
3. Discuss alternatives before implementation.
4. Once approved, submit a pull request with your implementation.

### Improving Documentation

1. Open a "Documentation Improvement" issue or discussion.
2. Suggest specific changes with examples.
3. Submit a pull request with updates to the wiki or inline documentation.

### Adding Modules or Features

1. Keep modules self-contained in `modules/features/` or `modules/common/`.
2. Follow existing naming conventions (no hyphens in identifiers).
3. Include clear comments explaining configuration options.
4. Test with at least one starter template (minimal, kde, or gnome).
5. Document the module in a discussion or wiki page.

## Commit Guidelines

- Write clear, descriptive commit messages in imperative form
- Reference related issues (e.g., "Fixes #42" or "Related to #15")
- Keep commits focused: one feature or fix per commit
- Include your real name and email in commits

## Pull Request Process

1. Create a feature branch: `git checkout -b feature/description`
2. Make your changes following the code style
3. Validate your work:
   ```bash
   statix check .       # Lint Nix code
   nixfmt *.nix         # Format Nix files
   nix flake check      # Check flake validity
   ```
4. Test all starters:
   ```bash
   test-minimal; test-gnome; test-kde
   ```
5. Push your branch and open a pull request with a clear description
6. Link related issues in the PR description
7. Respond to review feedback promptly

## Code Style and Structure

### Nix Code

- Use consistent indentation (2 spaces).
- Follow the existing module structure in `modules/`.
- Use descriptive variable and function names.
- Add comments for complex logic.
- Keep modules modular and reusable.

### File Organization

```
modules/
  common/          # Shared across all hosts
    nixos-core/    # Core NixOS settings
    disko/         # Disk partitioning layouts
  features/        # Reusable optional features
    home-manager/  # User dotfiles and packages
    workstation/   # Desktop environment setup
  hosts/           # Host-specific configuration
    HOSTNAME/
      default.nix
      hardware_report.json
```

### Naming Conventions

- Host names: lowercase, no hyphens (e.g., `laptop`, `desktop`, `server`)
- Module names: descriptive, snake_case (e.g., `my_feature.nix`)
- Variables: camelCase for Nix attributes (e.g., `hostName`, `stateVersion`)

## Testing Your Changes

Before submitting a pull request:

1. Ensure you are in the devenv shell
2. Lint and format:
   ```bash
   statix check .
   nixfmt *.nix
   markdownlint-cli2 .
   ```
3. Test all starters: `test-minimal; test-gnome; test-kde`
4. Document any new configuration options or modules

## Questions and Discussions

- **Questions:** Use Discussions > "Question"
- **Ideas:** Use Discussions > "Ideas"
- **Show and Tell:** Use Discussions > "Show and Tell"

## Code of Conduct

Be respectful and constructive in all interactions. Treat others as you'd like to be treated. We value diverse perspectives and encourage inclusive participation.

## Getting Help

- Review the [wiki documentation](https://github.com/muhammadtalha-quant/nucleus/wiki)
- Check existing issues and discussions
- Ask in Discussions if stuck

## Thank You

Your contributions help make Nucleus better. Thank you for participating!

# Shrimpram's Dotfiles

My dotfiles and config, managed using [stow](https://www.gnu.org/software/stow/).

## Installation

These can be installed using the `stow` command
to symlink all necessary files into place.

```bash
cd ~
git clone https://github.com/shrimpram/dotfiles.git
cd dotfiles
stow
```

The `.stow-local-ignore` file ensures that just running `stow` is
sufficient and files that should be ignored are not symlinked.

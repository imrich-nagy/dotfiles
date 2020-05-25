# Imrich Nagy's dotfiles

Files for setting up my development environment

- Contains a [Brewfile](./Brewfile) for installing dev tools on macOS using `brew`
- Includes a [setup script](./setup.fish) and [config dir](./.config/fish) for customizing `fish`


## Usage

Install system dependencies with `brew bundle`:

```
brew bundle install
```

Copy config files to the home directory:

```
cp -Rv .config ~
```

Run the setup script:

```
source setup.fish
```

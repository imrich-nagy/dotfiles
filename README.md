# imrich-nagy/dotfiles

My dotfiles for fish shell on macOS 🐟

## Usage

Copy config files to the home directory:

```
rsync -rv --exclude=.DS_Store ./home/ ~
```

Install software with `brew bundle`:

```
brew bundle install --global
```

Run the setup script for `fish`:

```
fish setup.fish
```

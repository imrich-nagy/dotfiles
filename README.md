# imrich-nagy/dotfiles

My dotfiles for fish shell on macOS 🐟

## Usage

Install software with `brew bundle`:

```
brew bundle install --file=./home/Brewfile
```

Copy config files to the home directory:

```
rsync -rv --exclude=.DS_Store ./home/ ~
```

Run the setup script for `fish`:

```
fish setup.fish
```

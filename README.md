# git-sandman <!-- omit in toc -->

Repository dedicated to prevent losing uncommited changes from git.

## Table of Contents <!-- omit in toc -->

- [Background](#background)
- [Prerequisites](#prerequisites)
  - [Homebrew](#homebrew)
  - [Git](#git)
- [Installation](#installation)
- [Configuration](#configuration)

## Background

Inspired by @b0rk's https://ohshitgit.com/ Saturday Zine: https://twitter.com/b0rk/status/1279077378936328192.

## Prerequisites

### Homebrew

To install Homebrew on macOS:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

To install Homebrew on Linux:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

### Git

We assume you have git installed on your system. If you don't, you can install it using brew:

```bash
brew install git
```

## Installation

To install Pocket-Core using brew just run those commands on the terminal of your system:

```bash
brew tap olshansk/git-sandman
brew install git-sandman
```

And to git-sandman, just use `git` normally.

## Configuration

Coming soon.

For now, all your diffs will be saved on `~/.git-sandman` folder.

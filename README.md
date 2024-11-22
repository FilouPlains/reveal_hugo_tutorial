<div align="center">

# 🦙 reveal_hugo_tutorial ⚡

![License MIT](https://img.shields.io/badge/License-MIT-green)
![CC-BY-SA](https://img.shields.io/badge/License-CC%E2%80%91BY%E2%80%91SA-green)
![Last commit](https://img.shields.io/github/last-commit/FilouPlains/reveal_hugo_tutorial.svg)

✍️ Contributor: **Lucas ROUAUD**

</div>

## 🌳 Module used

Here is a list of the module used to make this tutorial. By cloning this repository,
you will not need to install them all.

-   [Hugo](https://gohugo.io/)
-   [reveal.js](https://revealjs.com/)
-   [reveal-hugo](https://github.com/joshed-io/reveal-hugo)
-   [Molstar](https://molstar.org/)
-   [qrcodejs](https://davidshimjs.github.io/qrcodejs/)
-   [plotly.js](https://plotly.com/)

## 🌐 Installation

### 🐍 Using conda

First, clone this repository:

```bash
git clone --recurse-submodules -j8 https://github.com/FilouPlains/reveal_hugo_tutorial.git
cd reveal_hugo_tutorial
```

Then, using [conda](https://www.anaconda.com/download) or [miniconda](https://docs.anaconda.com/miniconda/),
install `Hugo` and `Plotly` like this:

```bash
conda env create -f env/environment.yml
```

Next, ativate the conda environment:

```bash
conda activate reveal-hugo
```

You are now technically abble to launch the presentation! To do so:

```bash
hugo server --renderStaticToDisk -p 1313
```

To finish, go, using your favorite web navigator (like Mozilla Firefox 😉) on this
next URL to see the “presentation hub”: [http://localhost:1313/](http://localhost:1313/).

### 📹 Using Nix

<details>
<summary><h4><em>🔸 Installing Nix for multi-user</em></h4></summary>

Download [Nix](https://nixos.org/download/) using this command:

```bash
# Multi-user installation.
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Next, enable `flakes`. To do so, add this:

```nix
experimental-features = nix-command flakes
```

To the `/etc/nix/nix.conf` file. One example to do so is to `cat` the file to check
if the line is not present. Then, if so, do:

```bash
sudo echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

**⚠️ Do not forget to close your terminal et reopen it to enable fully nix flakes!**

</details>

<details>
<summary><h4><em>🔸 Installing nix for single user</em></h4></summary>

Download [Nix](https://nixos.org/download/) using this command:

```bash
# Or you can do a single-user installation:
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

Next, enable `flakes`. To do so, add this:

```nix
experimental-features = nix-command flakes
```

To the `~/.config/nix/nix.conf` file. One example to do so is to `cat` the file to check
if the line is not present. Then, if so, do:

```bash
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

> **Note**
>
> You might have to create the `nix/` folder in `.config/` using:
> ```bash
> mkdir ~/.config/nix
> ```

**⚠️ Do not forget to close your terminal et reopen it to enable fully nix flakes!**

</details>

#### _🔸 Installing and using `reveal_hugo_tutorial`_

First, clone this repository:

```bash
git clone --recurse-submodules -j8 https://github.com/FilouPlains/reveal_hugo_tutorial.git
cd reveal_hugo_tutorial
```

Next, activate the Nix environment:

```bash
cd env/
nix develop
```

Or:

```bash
nix develop ${PWD}/env
```

You are now technically abble to launch the presentation! To do so:

```bash
serve
```

This is an alias create when activating the Nix environment. Basically it launch
this command:

```bash
hugo server --renderStaticToDisk -p 1313
```

Then open your brower on this next URL to see the “presentation hub”: [http://localhost:1313/](http://localhost:1313/).

## 📰 Tutorial

[👉 Check the markdown version of the tutorial here.](https://github.com/FilouPlains/reveal_hugo_tutorial/blob/main/tutorial.md)

## 🙇 Acknowledgement

Huge thanks to:

- **Yanna GAUTIER** for testing the conda environment and sending me trajectories!
- **Jules MARIEN** for testing both the conda and Nix environment!

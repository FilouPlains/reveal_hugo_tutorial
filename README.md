<div align="center">

# 🦙 reveal_hugo_tutorial ⚡

![License MIT](https://img.shields.io/badge/License-MIT-green)
![CC-BY-SA](https://img.shields.io/badge/License-CC%E2%80%91BY%E2%80%91SA-green)
![Last commit](https://img.shields.io/github/last-commit/FilouPlains/reveal_hugo_tutorial.svg)

✍️ Contributor: **Lucas ROUAUD**

</div>

## 🌳 Module used

Here is a list of the module used to make this tutorial. By cloning this repository,
you will not need to install them all:

|                                                         |                                                     |
| :-----------------------------------------------------: | :-------------------------------------------------: |
|               [Hugo](https://gohugo.io/)                |           [Molstar](https://molstar.org/)           |
|           [reveal.js](https://revealjs.com/)            | [qrcodejs](https://davidshimjs.github.io/qrcodejs/) |
| [reveal-hugo](https://github.com/joshed-io/reveal-hugo) |          [plotly.js](https://plotly.com/)           |

## 🌐 Installation

<details>
<summary><h3>🐍 Using conda</h3></summary>

You will need [miniconda](https://docs.anaconda.com/miniconda/) to proceed to the next installation:

```bash
# Clone this repository.
git clone --recurse-submodules -j8 https://github.com/FilouPlains/reveal_hugo_tutorial.git
cd reveal_hugo_tutorial

# Install Hugo and Plotly using miniconda.
conda env create -f env/environment.yml

# Activate the conda environment.
conda activate reveal-hugo

# Launch the presentation.
hugo server --renderStaticToDisk -p 1313
```

When the presentation is running, go, using your favorite web navigator,
on this next URL to see the “presentation hub”: [http://localhost:1313/](http://localhost:1313/).
</details>

<details>
<summary><h3>📹 Using Nix</h3></summary>

<details>
<summary><h4>🔸 Installing Nix for multi-user</h4></summary>

Download [Nix](https://nixos.org/download/) and set it up like that for multi-user:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

> [!NOTE]  
> You can also enable it for single user like that:
>
> ```bash
> sh <(curl -L https://nixos.org/nix/install) --no-daemon
> ```

</details>

<details>
<summary><h4>🔸 Enabling `flakes` and `nix-command`</h4></summary>

To enable `flakes` and `nix-command`, you can launch these commands:

```bash
# Create nix config directory.
mkdir --parents ~/.config/nix

# Enable `flakes` by adding `experimental-features = nix-command flakes` to
# `/etc/nix/nix.conf`.
grep --quiet "flakes" ~/.config/nix/nix.conf \   
    && echo "Flakes already enable." \   
    || echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

</details>

<details>
<summary><h4>🔸 Installing and using `reveal_hugo_tutorial`</h4></summary>

> [!WARNING]  
> Do not forget to close your terminal et reopen it to enable fully nix!

```bash
# Clone this repository.
git clone --recurse-submodules -j8 https://github.com/FilouPlains/reveal_hugo_tutorial.git
cd reveal_hugo_tutorial

# Activate the Nix environment.
nix develop ${PWD}/env

### # Or you can do:
### cd env/
### nix develop

# Launch the presentation.
serve
```

> [!NOTE]  
> The last command is an alias create when activating the Nix environment. Basically it launch
> these commands:
> 
> ```bash
> # Open your brower to see the “presentation hub”.
> xdg-open http://localhost:1313/
> # Launch the presentation
> hugo server --renderStaticToDisk -p 1313
> ```

If your browser load to quick, wait that hugo is fully launch and refresh the page. If the
browser does not open correctly, open manually your brower and go to this next URL to see
the “presentation hub”: [http://localhost:1313/](http://localhost:1313/).

</details>
</details>

## 📰 Tutorial

[👉 Check the markdown version of the tutorial here.](https://github.com/FilouPlains/reveal_hugo_tutorial/blob/main/tutorial.md)

## 🙇 Acknowledgement

Huge thanks to:

- **Yanna GAUTIER** for testing the conda environment and sending me trajectories!
- **Jules MARIEN** for testing both the conda and Nix environment!
- **Pierre POULAIN** for his comments on the tutorial.

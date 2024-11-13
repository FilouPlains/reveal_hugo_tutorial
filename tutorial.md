<div align="center">

# Tutorial to use `reveal-hugo` to make interactive slides using Markdown

</div>

## `reveal.js`

[Link: https://revealjs.com/](https://revealjs.com/)

On their website, they say:

> reveal.js is an open source HTML presentation framework. It's a tool that enables
> anyone with a web browser to create fully-featured and beautiful presentations for
> free.

To make it more simple: you type HTML, you have a presentation! But why this format
is that interesting? Because, in HTML, you can put whatever you want:

- A video
- An image
- JS interactive stuff
- Document

This is the first reason that I used it! Combining `plotly.js` interactive plots,
or even `Mol*` viewer inside a presentation? The things, is that HTML can be
tedious to write… It is possible to “write Markdown” inside these, but, like,
I mean… See by yourself:

```html
<section data-markdown>
  <textarea data-template>
    ## Slide 1
    A paragraph with some text and a [link](https://hakim.se).
    ---
    ## Slide 2
    ---
    ## Slide 3
  </textarea>
</section>
```

You still need HTML… It makes the syntax quite heavy to read, and not pratical to
use. It is better, using [`Emmet`](https://docs.emmet.io/), to make only HTML than
to switch time to time in Markdown… I need something more simple!

## `reveal-hugo`

[Link: https://github.com/joshed-io/reveal-hugo](https://github.com/joshed-io/reveal-hugo)

**Do you believe it?** I write in simple Markdown, and I have a beautiful presentation.
It is easier than LaTeX, stronger than PowerPoint, and it is free. In this tutorial,
I will show you how to make interactive slides using `reveal-hugo`!

First, assure you that you follow installation instruction in the [README.md](https://github.com/joshed-io/reveal-hugo).

## Setup

### `hugo.toml`

The `hugo.toml` is a file that allow you to configure how your presentation works.
Some important line that you need to understand. Note that by cloning the GitHub
repository, you will not need to redo all of that!

```toml
theme = ["reveal-hugo"]
```

It indicates to `hugo`, the software that translate Markdown into HTML, which theme
we want to use. Or, if you prefer, what will formatted our HTML files!

```toml
[params.reveal_hugo]
slide_number = true
width = 1920
height = 1080
```

`slide_number` add… slide number. `width` and `height` directly reflect the slides'
quality. Lower, quicker loading, but worst quality. I increase it. Note that you
will also need to manually increase font size!

```toml
[markup.highlight]
codeFences = false
```

This allows to render code block with [`highlight.js`](https://highlightjs.org/)
instead of `hugo`.

```toml
[[params.reveal_hugo.plugins]]
name = "RevealChalkboard"
source = "module/reveal.js-plugins/chalkboard/plugin.js"
css = "module/reveal.js-plugins/chalkboard/style.css"
```

An example of how to set `reveal.js` plugins. You give a name, which can be found
in the JavaScript of the plugin. [Here, for the chalkboard plugin](https://github.com/rajgoel/reveal.js-plugins/blob/master/chalkboard/plugin.js#L19).
Then, you give the path to the module CSS and JavaScript. And _voilà_!

### Markdown file header

You can give extra-parameters to the file header. By doing to, you can change theme
for a specific presentation.

```md
+++
title = "Tutorial"
outputs = ["Reveal"]

[reveal_hugo]
highlight_theme = "vs"
custom_theme = "/tutorial/style.css"
+++
```

`title` is the HTML title that will be given when launching your presentation.
`outputs` is mandatory in order to transform your Markdown into an HTML reveal.js
presentation. `highlight_theme` is the colour theme used for the code block.
[Test all available theme here](https://highlightjs.org/demo). Then, the `custom_theme`
parameter. You have two choices:

1. Replace this parameter with `theme` and [use one of the `reveal.js` theme](https://revealjs.com/themes/).
For instance, it would look like this: `theme = "white"`.
2. Give the full path (from the website root) of your custom CSS.

That's it!

## Folder architecture to follow

In the `reveal_hugo_tutorial`, you will have to need the next architecture:

- In `content/`, create a folder named as your wish, that reflects you project.
  For instance `content/hype_seminar/`. Then, inside this folder, create a file
  called `_index.md`. In this file, you put your “code” / text for your presentation.
- In `static/`, create the exact same folder. So here, it would be `static/hype_seminar`.
  Here, you put all external things to add, like video, images, other HTML file…

## Adding element to the presentation

### Basic markdown element

You can check this web page [https://www.markdownguide.org/basic-syntax/](https://www.markdownguide.org/basic-syntax/)
in order to check basic Markdown syntax.

There are things which behavior have been changed:

1. Code block using `\`` .
2. Rules using `---`.
3. LaTeX equation using \$ or \$\$.

### New slides

To declare a new slide, use `---`.

```md
# First slide

---

# Second slide
```

### Scrolling vertically

Add `{{% section %}}{{% /section %}}` arround the slide you want to scroll vertically
on.

```md
# Normal slide

---

{{% section %}}

# Vertical slide 1

---

# Vertical slide 2

{{% /section %}}

---

# Normal slide
```

### QR Code

To insert QR code, use `{{% qr_code %}}`. Parameters, width default values, are:

- **`link=""`**
- **`size=360`**
- **`background="#FFF0"`**
- **`foreground="#000"`**

```md
{{% qr_code link="https://www.google.com" %}}
```

#### Classical code block
### Code block

Use \`\`\` to insert code block. Add the extension to choose a language, like \`\`\`py.
You can add number to animates lines. For instance, this:

```md
    ```py{1|2-8|}
    def toto():
        return "lol"
    ```
```

This will highlight line 1, then line 2 to 8, and then every line.

### Code block from external file

Use `{{% external_code %}}` to add code block. Parameters, with default values,
are:

- **`language=""`**
- **`src=""`**
- **`class=""`**
- **`show_line=true`**

```md
{{% external_code language="md" src="./README.md" class="toto" %}}
```

### Math equation

To type inline equation, like $a = x^2$, do:

```md
like {{% math inline="a = x^2$" /%}}
```

And block equation, like:

$$
\displaystyle\sum_{i = 0}^n i^2
$$

Do:

```md
{{% math %}}
\displaystyle\sum_{i = 0}^n i^2
{{% /math %}}
```

### Animation

You can animate using fragment. For instance, this:

```md
{{% fragment %}} One {{% /fragment %}}
{{% fragment %}} Two {{% /fragment %}}
{{% fragment %}} Three {{% /fragment %}}
```

Will show `One`, `Two`, `Three` gradually.

### Custom properties

You can add custom properties to the current slide. This:

```md
---

{{% slide background-color="#FF4081" %}}

# Slide

---
```

Change the current slide background. And that:

```md
---

{{% slide background-image="./img/yes_we_can.jpg" %}}

# Slide

---
```

Change the slide picture background.

### Special table design

Doing this:

```md
| **PDB code** | **Nb atoms** | **Description**     |
| :----------: | :----------: | :------------------ |
|     4f8v     |     500      | Nothing…            |
{class=design}
```

Will change the table design.

### Alignment

Doing that:

```md
# Slide

{{% grid %}}
- Toto
- Tata

![picture](picture.jpg)
{{% /grid %}}

---
```

Will put to left of the slide a list and to the right a picture, like this:

```css
┏━━━━━━━━━━━━━━━━━━━━━━━━┓
┃          SLIDE           ┃
┃                          ┃
┃                          ┃
┃  - Tata     ▒▒▒▒▒▒▒▒▒    ┃
┃  - Toto     ▒picture▒    ┃
┃             ▒▒▒▒▒▒▒▒▒    ┃
┃                          ┃
┃                          ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━┛
```

### External `iframe`

Using `{{% iframe %}}`, you can insert iframe to display external content like
other HTML content. Parameters, with default values, are:

- **`src=""`**
- **`width="100%"`**
- **`height="800px"`**
- **`class=""`**

```md
{{% iframe src="./molstar/1jli/molstar.html" width="100%" height="800px" %}}
```

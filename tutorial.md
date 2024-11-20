<div align="center">

# Tutorial to use `reveal-hugo` to make interactive slides using Markdown

</div>

## Deep-in in negative points

I do not like people that sell their software or method as the best one. All have pros
and cons. Here, In this first section, you will find the cons. The pros after. Also,
it is my POV. So it might change for yours, obviously!

### Cons (in english, not french)

1. **Slides are more heavy.** Logic. You can interact with elements, but they take
   more time to load…
2. **Not sharable.** You can do a PDF export, yes. But not share the HTML version. It could
   be done. But quite tedious for nothing.
3. **Interactivity is a silent danger.** Wait for me to move that. Wait until that load.
   Showing something but not talking… BEWARE! Do not let you fool by your own slides! You
   need to talk to your audience, animate the talk. It is very easy to lost time or let the
   silent goes in, if you are not enough careful…
4. **Complex to animate.** You are not in PowerPoint. So no fancy animation, sorry. You can
   still do amazing stuff using CSS or some reveal.js [transitions](https://revealjs.com/transitions/)
   and  [animation](https://revealjs.com/auto-animate/). But it is some work, so prepare!
5. **It is like a LaTeX format.** No drawing or copy-paste here! You make you figure on inkscape,
   export it `.svg` format, put it in the right folder, then import it… More tedious, but once
   it is done, more easy to come back, modify things, without losing anything!

### Pros

1. **It is like a LaTeX format.** Wait, what? Indeed, you can use git to keep a track of
   your work. Reuse picture or figure. Not loosing time on the formatting, but taking
   care of the content. And, if you modify one title, everything change! Beautiful.
2. **HTML.** It is beautiful, because you can use GIF, video, PDF, HTML, JavaScript!
   So no limitation, of, I do know, a specific format of video to insert inside your presentation…
3. **Stay simple.** By using this, it force you to be more concise and direct with your talk.
   And for what I have saw, it is not a cons!

## Sumary

I do considere here that there are more cons that pros. But the pros have more weight than
the cons. And as always, test it and see by yourself!

## `reveal.js`

- [Link: https://revealjs.com/](https://revealjs.com/)

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

- [Link: https://github.com/joshed-io/reveal-hugo](https://github.com/joshed-io/reveal-hugo)

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

Will change the table design. More precisely, using this method, you can apply CSS
classes to specific elements.

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
┏━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃          SLIDE           ┃
┃                          ┃
┃                          ┃
┃  - Tata     ▒▒▒▒▒▒▒▒▒    ┃
┃  - Toto     ▒picture▒    ┃
┃             ▒▒▒▒▒▒▒▒▒    ┃
┃                          ┃
┃                          ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━┛
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

## CSS

- [Link: https://developer.mozilla.org/fr/docs/Web/CSS](https://developer.mozilla.org/fr/docs/Web/CSS)
- [Link: https://www.w3schools.com/css/](https://www.w3schools.com/css/)

CSS is a language that allows to change the format / style of a HTML page.
We are not going to go in depth with it, but we are going here to give some basic
concepts.

First, use `[Ctrl]+[Shift]+[i]` (or `[C-I]` for vim user :p) to display the developper
tool of your web browser. With it, you can **inspect** a web page, in order to check
HTML or CSS element.

In CSS, to modify a HTML tag, like `<p></p>`, you can do:

```css
p {
    font-color: red;
}
```

Here, all `<p>` tag, which represent a paragraph, will be stylized in red. If you
want to modify a class, you can do:

```css
.css-class {
    font-weight: bold;
}
```

Here, all element with the class `css-class`, will be in bold!

## Plotly

- [Link: https://plotly.com/python/](https://plotly.com/python/)

In short, plotly let you made interactive plot! This can be very handy when you
want to zoom on specific parts. Again, not going in depth with this module. Note
that it is available in R and JavaScript… The most import code lines, in python,
that you will need, are these ones:

```py
figure: Figure = Figure()

figure.write_html(
    full_html=False,
    include_plotlyjs="/module/plotly.js/dist/plotly.js",
    file="plot.html",
    default_height="100%",
    default_width="100%",
)
```

The first line is just to say that you will need to create a Plotly `Figure` from
`plotly.graph_objects` to export it in HTML format. Use `.write_html()` to export
your figure in HTML format, at the end od your script. In order, lines meaning are:

- **`full_html`:** Do you want a full HTML page when exporting? Here, no.
- **`include_plotlyjs`:** The path to the Plotly JavaScript. Using this repository,
  you will have to let this given path!
- **`file`:** The name of the exported file.
- **`default_height`:** We want Plotly to take full height in its `iframe`.
- **`default_width`:** We want Plotly to take full width in its `iframe`.


## Mol*

- [Link: https://molstar.org/viewer/](https://molstar.org/viewer/)

Again, not going in depth with this. To export a molecule, go to `Plugin State`
and then click on `Session`. Renamed it `structure.molx`. Now, you will need to
duplicate, in this repository, the folder `static/tutorial/molstar/1jli` anywhere
you want in the `static/` folder. Then, rename the copy / pasted directory as your
whish, like `static/my_molecule/`. To finish, just move `structure.molx` in the
created directory!

You are now able to display your molecule, like this:

```md
{{% iframe src="/my_molecule/molstar.html" %}}
```

## PDF export

First, change the URL presention from `localhost:1313/presentation_name/#/number`
to `localhost:1313/presentation_name/?print-pdf`. So for instance, for the tuturial
presentation, if you have something like `http://localhost:1313/tutorial/#/2`, change
it to `http://localhost:1313/tutorial/?print-pdf`.

Then, to print it, you need to press `[Ctrl]+[p]`. You need to verify few things:

1. Print to file, like `index.pdf`.
2. Enable the print of background images and colours.
3. Disable header and footers.
4. Change the paper to landscape.
5. Change the format size to `16:9`. You can create your own setup with the size
   `114.3 mm` per `203.22mm`.

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

### Slide header

You can give extra-parameters to the slide header. By doing to, you can change theme
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

+++
title = "Tutorial"
outputs = ["Reveal"]

[reveal_hugo]
highlight_theme = "vs"
custom_theme = "/tutorial/style.css"
+++

# Time to start the tutorial!

This is my first slide.

---

# New slide?

In order to create a new slide, separate with `---`.

---

# You can use basic MarkDown element

## Like subtitle

Text in **bold** or _italic_. Nice `code`!

You can even have list:

- Of what
- to do

Or you can:

1. Give order
2. To some task

---

# About images?

![Yes, we can](./img/yes_we_can.jpg)

You will need to put them inside the right directory…

---

{{% section %}}

# Now, time to see…

---

# `reveal.js` and `hugo-reveal` specific element!

---

Using `{ {% section %}}\{ {% /section %}}` to scroll down!

{{% /section %}}

---

# QR code 

{{% grid  %}}
{{% qr_code link="https://www.google.com" %}}
{{% qr_code link="https://bit.ly/3BlS71b" size=500 background="#FF0" foreground="blue" %}}
{{% /grid %}}

Beautiful, indeed!

QR code parameters:

- **`link=""`**
- **`size=360`**
- **`background="#FFF0"`**
- **`foreground="#000"`**

---

{{% section %}}
# Want to see some Python code?

## Of course you do 👀

```python
def toto() -> str:
    """A function that have no purpose.

    Return
    ------
    `str`
        I mean, do I really have to explain?
    """
    return "WAHOU!"
```

---

# And with some animation, _s'il-vous plaît_

```python{1|2-8|}
def toto() -> str:
    """A function that have no purpose.

    Return
    ------
    `str`
        I mean, do I really have to explain?
    """
    return "Omelette au fromage…"
```

---

# And using external file!

{{% external_code language="md" src="./README.md" class="toto" %}}

Use `ln -s source_file link_name_path`

**Parameter:**

- **`language=""`**
- **`src=""`**
- **`class=""`**
- **`show_line=true`**

{{% /section %}}

---

# Let us add some equations!

{{% math %}}
\displaystyle\sum_{i = 0}^{\text{number of atoms}} \left( \dfrac{d_i - \mu}{2 \sigma^2} \right)
{{% /math %}}

**⚠️:  Not available offline `:(`**

---

# ANIMATION???

{{% fragment %}} One {{% /fragment %}}
{{% fragment %}} Two {{% /fragment %}}
{{% fragment %}} Three {{% /fragment %}}

---

{{% slide background-color="#FF4081" %}}

# Custom slide 2

---

{{% slide background-image="./img/yes_we_can.jpg" %}}

# Custom slide 3

This slide has a background image.

---

# What are CSS classes?

| **PDB code** | **Nb atoms** | **Description**     |
| :----------: | :----------: | :------------------ |
|     4f8v     |     500      | Nothing…            |
|     6f5f     |     2346     | Still nothing…      |
|     d6d8     |      44      | Ha wait!            |
|     8aze     |     789      | Not, still nothing… |
{class=design}

---

{{% grid %}}

- Toto
- Tata

1. Toto
2. Tata

![Yes, we can](./img/yes_we_can.jpg)

{{% /grid %}}

- Toto
- Tata

1. Titi
2. Je sais où est-ce que tu habites…

Comment vas-tu?

---

# Iframe too! 😏

{{% iframe src="https://highlightjs.org/demo" width="100%" height="500cm" %}}

Parameters:

- **`src=""`**
- **`width="100%"`**
- **`height="800px"`**
- **`class=""`**

---


## Interactive plot \\(xOx)/ {{% math "E=mc^2" /%}} 

{{% iframe src="./plot/plot.html" width="100%" height="800px" %}}

---

# That is what you were all waiting for >:D

{{% iframe src="./molstar/1jli/molstar.html" width="100%" height="800px" %}}

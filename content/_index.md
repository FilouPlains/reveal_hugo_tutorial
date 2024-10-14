+++
title = "Tutorial"
outputs = ["Reveal"]

[reveal_hugo]
theme = "white"
highlight_theme = "vs"
custom_theme = "content/index/style.css"
+++

# Time to start the tutorial!

This is my first slide.

---

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

```python{1|2-8|}
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

# Let us add some equations!

{{% math %}}
\displaystyle\sum_{i = 0}^{\text{number of atoms}} \left( \dfrac{d_i - \mu}{2 \sigma^2} \right)
{{% /math %}}

---

# Mermaid diagram???

{{% mermaid %}}
graph RL
A --> B
B --> C
C --> A
{{% /mermaid %}}

---

# ANIMATION???

{{% fragment %}} One {{% /fragment %}}
{{% fragment %}} Two {{% /fragment %}}
{{% fragment %}} Three {{% /fragment %}}

---

{{% section %}}

# Non mais attonds

## Tes diapos…

---

## …peuvent scroller de haut en bas!

{{% /section %}}

---

{{% slide background-color="#FF4081" %}}

## Custom slide 2

---

Custom slide 3

This slide has a background image.

---

…

{{% note %}}

-   Wait, you can see this, don't you…

{{% /note %}}

---

# Iframe too! 😏

<iframe src="https://highlightjs.org/demo" width="100%" height="500cm"></iframe>

---

| **PDB code** | **Nb atoms** | **Description**     |
| :----------: | :----------: | :------------------ |
|     4f8v     |     500      | Nothing…            |
|     6f5f     |     2346     | Still nothing…      |
|     d6d8     |      44      | Ha wait!            |
|     8aze     |     789      | Not, still nothing… |

---

<div class="grid">

- Toto
- Tata

1. Toto
2. Tata

</div>

---

## Interactive plot \\(xOx)/ {{% math "E=mc^2" /%}} 

<iframe src="/content/index/plot/plot.html" width="100%" height="800px"></iframe>

---

# That is what you were all waiting for >:D

<iframe src="/content/index/molstar/1jli/molstar.html" width="100%" height="800px"></iframe>

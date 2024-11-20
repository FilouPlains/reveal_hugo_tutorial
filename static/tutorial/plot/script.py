"""Script to produce plotly graph in order to show gaussian."""

__authors__ = ["Lucas ROUAUD"]
__contact__ = ["lucas.rouaud@gmail.com"]
__date__ = "23/09/2024"
__copyright__ = "MIT License"

from plotly.graph_objects import Figure, Scatter
import numpy as np


def draw_plot() -> Figure:
    """Draw a plot…

    Returns
    -------
    `Figure`
       Return a format figure. 
    """
    figure: Figure = Figure(
        data=[
            Scatter(
                x=np.arange(0, 10),
                y=np.arange(0, 10) ** 5,
                marker={
                    "size": 12,
                    "opacity": 1,
                    "color": "#FF0000",
                },
                mode="markers",
            )
        ]
    )

    figure.update_layout(
        title="",
        template="simple_white",
        font={"size": 12, "family": "Roboto light"},
        xaxis={
            "title": {"text": "<b>x</b>", "font_size": 42},
            "showline": True,
            "linewidth": 1,
            "showgrid": False,
            "title_font": {"family": "Roboto Black"},
        },
        yaxis={
            "title": {"text": "<b>f(x) = x^5</b>", "font_size": 42},
            "showline": True,
            "linewidth": 1,
            "showgrid": False,
            "title_font": {"family": "Roboto Black"},
        },
        plot_bgcolor="rgba(0, 0, 0, 0)",
        paper_bgcolor="rgba(0, 0, 0, 0)",
        margin={"l": 100, "r": 100, "t": 100, "b": 100, "autoexpand": False},
    )

    return figure


if __name__ == "__main__":
    plot: Figure = draw_plot()

    plot.write_html(
        full_html=False,
        include_plotlyjs="/module/Plotly/script.js",
        file="plot.html",
        default_height="100%",
        default_width="100%",
    )

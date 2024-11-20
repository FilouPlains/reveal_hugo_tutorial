#!/bin/bash
# SCRIPT: ./UPLOAD
# AUTHOR: Lucas ROUAUD <lucas.rouaud@gmail.com>
# DATE:   20/11/2024
#
# DESCRIPTION
# Fetch JS and CSS of of external module to update them!
#
# USAGE
# ./update.sh
#
# DEPENDENCIES
# - wget : To fetch online JS and CSS.

cd '../static/module/'

# FontAwesome
wget --output-document='FontAwesome/script.js' 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/js/all.min.js'
wget --output-document='FontAwesome/style.css' 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/refs/heads/6.x/css/all.min.css'

# MathJax
wget --output-document='Mathjax/script.js' 'https://raw.githubusercontent.com/mathjax/MathJax/refs/heads/master/es5/tex-svg-full.js'

# Mermaid
wget --output-document='Mermaid/script.js' 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'

# PlotlyJs
wget --output-document='https://raw.githubusercontent.com/plotly/plotly.js/refs/heads/master/dist/plotly.min.js'

# QrCodeJs
wget --output-document='https://raw.githubusercontent.com/davidshimjs/qrcodejs/refs/heads/master/qrcode.min.js'

# RevealPlugins/Chalkboard
wget --output-document='RevealPlugins/Chalkboard/script.js' 'https://raw.githubusercontent.com/rajgoel/reveal.js-plugins/refs/heads/master/chalkboard/plugin.js'
wget --output-document='RevealPlugins/Chalkboard/style.css' 'https://raw.githubusercontent.com/rajgoel/reveal.js-plugins/refs/heads/master/chalkboard/plugin.js'

# RevealPlugins/CustomControl
wget --output-document='RevealPlugins/CustomControl/script.js' 'https://raw.githubusercontent.com/rajgoel/reveal.js-plugins/refs/heads/master/customcontrols/plugin.js'
wget --output-document='RevealPlugins/CustomControl/style.css' 'https://raw.githubusercontent.com/rajgoel/reveal.js-plugins/refs/heads/master/customcontrols/style.css'

# RevealPlugins/RevealExternalCode
wget --output-document='RevealPlugins/RevealExternalCode/script.js' 'https://raw.githubusercontent.com/dafrenchyman/reveal.js-extrernal-code/refs/heads/master/externalcode.js'

# Molstar
wget --output-document='Molstar/script.js' 'https://molstar.org/viewer/molstar.js'
wget --output-document='Molstar/style.css' 'https://molstar.org/viewer/molstar.css'

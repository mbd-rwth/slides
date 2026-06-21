# Contributing

## Local development

Open the repo in VS Code with the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension installed. VS Code will build the Docker image from `Dockerfile` and drop you into a fully configured environment with Quarto, Python, and all dependencies ready.

## Rendering the slides

```bash
quarto render
```

Output goes to `_site/index.html`. Open it in a browser to preview the slides.

For live preview during editing:

```bash
quarto preview slides/index.qmd
```

## Suggesting changes

Open an issue or pull request on GitHub. For slide content edits, edit `slides/index.qmd` directly.

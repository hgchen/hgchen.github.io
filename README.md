# Huaijin (George) Chen’s personal website

[hgchen.com](https://hgchen.com) runs on Jekyll and [al-folio v1.2](https://github.com/alshedivat/al-folio/releases/tag/v1.2). The Gemfile pins the theme and its plugins. Their gems provide the layouts, styles and scripts.

## Local preview

With Docker installed, run the following command and open [localhost:8080](http://localhost:8080).

```sh
docker compose up --build
```

For a native build, install Ruby 3.3 or 3.4, Bundler 4.0.6, Node.js, ImageMagick and Python. Run these commands from the repository root, with a Python virtual environment active.

```sh
python -m pip install -r requirements.txt
bundle install
bundle exec jekyll serve
```

## Site content

- Edit the biography and homepage news limit in `_pages/about.md`. The full news archive uses the entries in `_news/`.
- Add publications to `_bibliography/papers.bib`. Update `_data/socials.yml` for contact links.
- Edit the short bio in `_pages/cv.md` and replace `assets/pdf/hgc_cv.pdf` to update the downloadable CV.

To check a theme update, run `bundle exec al-folio upgrade audit` and `JEKYLL_ENV=production bundle exec jekyll build`. The deploy workflow publishes the built site to GitHub Pages on pushes to the default branch.

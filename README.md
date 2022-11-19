# My personal blog

- The blog is reachable under:
  - https://islomar.es
  - http://islomar.es (it should be redirected to https)
  - https://islomar.github.io (it should be redirected to https://islomar.es)
  - http://islomar.github.io (it should be redirected to https://islomar.es)
- Sitemap: https://islomar.es/sitemap.xml
- Theme: minimal-mistakes.
  - https://mmistakes.github.io/minimal-mistakes/
  - https://github.com/mmistakes/minimal-mistakes

## How to run the blog locally

It is configured with hot reload.

### With Docker

Run `make docker-up` or `docker compose up`

### Without Docker

- **Prerequisites**
  - `sudo apt-get install ruby ruby-dev`
  - `sudo gem install bundler`
  - You need to have installed the dependencies in your machine, run `make deps`.
- Then, to start the Jekyll server locally:
  1. `make up`
  2. [Open in a browser](http://127.0.0.1:4000/)

## Other configuration

- I'm using Cloudflare to serve SSL and other features.
- favicon generated with https://realfavicongenerator.net/
- Google Analytics
- Google Search Console
- https://mmistakes.github.io/minimal-mistakes/markup/markup-html-tags-and-formatting/

## Icons and demo images

- [The Noun Project](https://thenounproject.com/)
- [Font Awesome](https://fontawesome.com/)
- [Unsplash](https://unsplash.com/)
- https://undraw.co/
- https://cocomaterial.com/

## References

- [How to create a Jekyll navigation menu](https://www.youtube.com/watch?v=6h8-uPadFug)

## Other blogs with Minimal Mistakes
- https://philippe.bourgau.net/
- https://juan.pallares.me/

## TO DO
- Arreglar la búsqueda: https://mmistakes.github.io/minimal-mistakes/docs/configuration/#site-search
- Last modified at:
  - https://github.com/gjtorikian/jekyll-last-modified-at
  - ¿Ya aparece?
- Pedir feedback de nueva sección
  - Fondo y forma, todo vale. Espanglish. Usado el "toc" auto-generado que ofrece Jekyll. No sé si los topics aporta realmente valor...
  - Twitter
  - Edu Ferro
  - Marcos
  - Fran
  - Jordi
  - Borja
  - Rubén
- Tags vs Categories
  - https://jekyllrb.com/docs/posts/
  - mirar Juan Pallares cómo lo usa
- Subscription:
  - Mirar aquí: https://juan.pallares.me/it-has-never-been-easier-to-have-a-blog/
  - https://github.com/jpallares/PallaresBlog/blob/6a8765e57e051ef659d8a401b63d563d7c9ef3ce/_layouts/single.html
  - https://www.youtube.com/watch?v=zhHY4tWpFz4
    - https://blog.webjeda.com/jekyll-subscribe-form/
  - https://mailchimp.com/es/help/add-a-signup-form-to-your-website/
  - Mailchimp: gratis hasta 2000 suscriptores
- Home splash: https://mmistakes.github.io/minimal-mistakes/docs/layouts/#splash-page-layout
- Poner imagen de fondo para sección de charlas
  - https://mmistakes.github.io/minimal-mistakes/docs/configuration/#site-default-teaser-image
- [Mostrar breadcrumbs](https://mmistakes.github.io/minimal-mistakes/docs/configuration/#breadcrumb-navigation-beta)
- https://mmistakes.github.io/minimal-mistakes/docs/layouts/#social-sharing-links
- Multilingual:
  - https://forestry.io/blog/creating-a-multilingual-blog-with-jekyll/
  - https://juan.pallares.me/configure-jekyll-multi-language-without-plugin/
  - https://github.com/mmistakes/minimal-mistakes/discussions/2660
- Incluir cuando se actualizó por última vez una página:
  - https://juan.pallares.me/books/el-plan-revolucionario/
- Read about "Incremental build"
- `Error loading credentials from netrc file for https://api.github.com/`
- Add comments provider (e.g. Disqus):
  - https://mmistakes.github.io/minimal-mistakes/docs/configuration/#disqus
  - https://meta.discourse.org/t/embedding-discourse-comments-via-javascript/31963
- Change the home page to a "splash" layout.
  - Create home.md under \_pages
  - https://github.com/mmistakes/minimal-mistakes/blob/776ab26ce11e786bbce5c632e53036e9e670344c/docs/_pages/home.md
- Link to interesting people
- [Parse your Kindle clippings to create a book collection in Jekyll](https://juan.pallares.me/parse-your-kindle-clippings-into-your-jekyll-blog/)
- Differentiate tags and categories:
  - https://www.bloggingbasics101.com/what-is-the-difference-between-blog-categories-and-blog-tags/
  - https://www.elegantthemes.com/blog/tips-tricks/best-practices-for-using-categories-and-tags-in-wordpress
  - Categories: "Product and software development", "Personal reflections", "Social sciences", etc.
  - tags: sofware-development, testing, tdd, meditation, english...
- Google Optimize:
  - https://www.cross-validated.com/How-to-install-Google-Optimize/
- SEO: https://github.com/jekyll/jekyll-seo-tag/
- "Some rights reserved"?
- To explore:
  - excerpt
  - Posts with a header video
  - [Posts with an image header](https://mmistakes.github.io/minimal-mistakes/docs/layouts/#headers)
  - Enable breadcrumbs
  - Twitter Cards:
    - https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/player-card
  - More examples: https://mmistakes.github.io/minimal-mistakes/tags/

# My personal blog
* The blog is reachable under:
    * https://islomar.es
    * http://islomar.es (it should be redirected to https)
    * https://islomar.github.io (it should be redirected to https://islomar.es)
    * http://islomar.github.io (it should be redirected to https://islomar.es)
* Theme: minimal-mistakes.
    * https://mmistakes.github.io/minimal-mistakes/
    * https://github.com/mmistakes/minimal-mistakes


## How to run the blog locally
It is configured with hot reload.

### With Docker
`docker-compose up`

### Without Docker
* **Prerequisites** 
    * You need to have installed the dependencies in your machine, run `make deps`.
* Then, to start the Jekyll server locally:
    1. `make up`
    2. [Open in a browser](http://127.0.0.1:4000/)


## Other configuration
* I'm using Cloudflare to serve SSL and other features.
* favicon generated with https://realfavicongenerator.net/


## TO DO
* Donate to Minimal Mistakes
* https://mmistakes.github.io/minimal-mistakes/docs/layouts/#social-sharing-links
* Read about "Incremental build"
* Add comments provider (e.g. Disqus): https://mmistakes.github.io/minimal-mistakes/docs/configuration/#disqus
* Include list with talks, workshops, etc.
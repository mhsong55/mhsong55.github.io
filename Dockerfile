FROM jekyll/jekyll:latest
LABEL maintainer="mhsong01@zenithn.com"

COPY . /srv/jekyll

WORKDIR /srv/jekyll

EXPOSE 4000

CMD [ "jekyll", "serve", "--force_polling", "--drafts", "--livereload", "--trace" ]

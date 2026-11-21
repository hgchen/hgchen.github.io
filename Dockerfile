FROM ruby:3.3-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git imagemagick inotify-tools jupyter-nbconvert \
    locales nodejs zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV EXECJS_RUNTIME=Node \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JEKYLL_ENV=production

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
RUN gem install --no-document bundler -v 4.0.6 && bundle install

EXPOSE 8080
COPY bin/entry_point.sh /tmp/entry_point.sh
CMD ["/tmp/entry_point.sh"]

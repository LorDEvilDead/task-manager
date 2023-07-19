FROM ruby:2.7.1-alpine

ARG RAILS_ROOT=/task_manager
ARG PACKAGES="vim openssl-dev postgresql-dev build-base curl nodejs yarn less tzdata git postgresql-client bash screen gcompat"

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES

RUN apk add --update --no-cache --virtual .build-deps python2 \
    && curl -o- -L https://yarnpkg.com/install.sh | sh \
    && export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" \
    && yarn install --check-files \
    && apk del .build-deps    

RUN gem install bundler:2.1.4

RUN apk add --update --no-cache nodejs-current npm \
    && npm install -g n \
    && n 14

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000

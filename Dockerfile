# Create a Jekyll container from a Ruby Alpine image

# At a minimum, use Ruby 2.5 or later
FROM ruby:3.1-alpine
# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update the Ruby bundler and install Jekyll
RUN gem update bundler && gem install bundler jekyll

WORKDIR /site
COPY . .

# Install all gems found in Gemfile
RUN bundle install

# Launch the jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--port=4000", "--host=0.0.0.0"]

EXPOSE 4000:4000
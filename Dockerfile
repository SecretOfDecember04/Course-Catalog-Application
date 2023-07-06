FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY . .
RUN bundle install
EXPOSE 3000
CMD ["rails server"]
#CMD ["bash"]
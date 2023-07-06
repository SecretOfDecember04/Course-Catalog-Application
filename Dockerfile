FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY . .
RUN bundle install
EXPOSE 3000
#CMD ["bash"]
#CMD ["rails", "server", "-b", "0.0.0.0"]
RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
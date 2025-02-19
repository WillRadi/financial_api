FROM ruby:3.2

# Define ambiente
ENV RAILS_ENV=development
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3

# Define diretório de trabalho
WORKDIR /app

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs

# Copia o Gemfile e Gemfile.lock para instalar as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante do código
COPY . .

# Expõe a porta da aplicação
EXPOSE 3000

# Comando para rodar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]

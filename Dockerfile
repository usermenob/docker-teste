# -----------------------------------------------------------
# Estágio 1: BUILD
# Imagem pesada, só usada durante o CI. Nunca vai para produção.
# -----------------------------------------------------------
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copia primeiro só o pom.xml para aproveitar cache de camadas do Docker.
# Se o código mudar mas as dependências não, o Docker reusa esta camada.
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Agora copia o código-fonte e builda de fato
COPY src ./src
RUN mvn -B clean package

# -----------------------------------------------------------
# Estágio 2: EXPORT
# Imagem mínima só para facilitar a extração do artefato final.
# Não é um "runtime" do app desktop (isso roda na máquina do usuário).
# -----------------------------------------------------------
FROM alpine:3.20 AS export
WORKDIR /out
COPY --from=build /app/target/desktop-demo.jar .

# Dockerfile

# Etapa 1: Build da aplicação usando Maven
FROM maven:3.9.2-eclipse-temurin-17 AS build

WORKDIR /app

# Copia os arquivos de configuração do Maven e código-fonte
COPY pom.xml .
COPY src ./src

# Builda o projeto e gera o jar executável
RUN mvn clean package -DskipTests

# Etapa 2: Rodar a aplicação com JDK leve (distroless ou OpenJDK slim)
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copia o jar da etapa build
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta padrão da aplicação
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
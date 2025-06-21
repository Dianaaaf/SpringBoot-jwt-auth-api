
Este projeto implementa uma API RESTful com **Spring Boot**, **JWT**, **Spring Security**, **H2**, **Swagger/OpenAPI**, **Docker** e **JMeter** para testes de carga.

---

## Requisitos

- Java 17+
- Maven 3.8+
- Docker (opcional, para containerização)
- JMeter (para testes de carga)
- Git (para clonar o repositório)

---

## Build e Execução Local

### Build:

```bash
mvn clean package
```

### Rodar a Aplicação:

```bash
java -jar target/autenticacaoeautorizacaojwt-0.0.1-SNAPSHOT.jar
```

```
http://localhost:8080
```

---

## 🗄️ Console H2

Acesse pelo navegador:

```
http://localhost:8080/h2-console
```

**Configurações de Conexão:**

- JDBC URL: `jdbc:h2:mem:testdb`
- User: `sa`
- Password: *(em branco)*

---

## Documentação Swagger

```
http://localhost:8080/swagger-ui.html
```

---

## Executar Testes Unitários

```bash
mvn test
```

---

## Executar o Projeto com Docker

### Rodar o Container:

```bash
docker run -p 8080:8080 autenticacaojwt
```

---

## Testes de Carga com JMeter

### 1. Instalar o Apache JMeter:

- Baixe em: https://jmeter.apache.org/download_jmeter.cgi
- Extraia o zip.
- Execute:  
  - Windows → `jmeter.bat`  
  - Linux/Mac → `jmeter.sh`

### 2. Abrir o Plano de Teste:

- Dentro da pasta do projeto, acesse `/jmeter-tests/`
- Abra o arquivo: `login_stress_test.jmx`

### 3. Configurar o Teste:

- Número de usuários: 200
- Ramp-up: 20 segundos
- Loop Count: 10
- Endpoint de Teste: `/auth/login`

### 4. Executar:

- Clique no botão verde "Start" no JMeter.
- Monitore via "Summary Report" e "View Results Tree".

---

## 🔎 Endpoints Principais

- **Login JWT:**  
`POST /auth/login`

- **Validação de Token:**  
`POST /auth/validate`

- **Endpoints protegidos de exemplo:**  
`GET /api/hello`  
`GET /api/admin`

---

## Usuários Banco H2

| Username | Senha    | Role  |
|--------- |--------- |----- |
| admin    | 123456   | ADMIN |
| user     | password | USER  |

*(Criados automaticamente ao iniciar a aplicação)*
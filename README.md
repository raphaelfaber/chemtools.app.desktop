# ChemTools Desktop App

## Requisitos

- Java 25
- Maven
- Node.js

## Preparo

```bash
npm install
```

Baixe as dependências Maven e compile o projeto:

```bash
./mvnw clean compile
```


## Desenvolvimento

Inicia Spring Boot e Tailwind em modo watch:

```bash
npm run dev
```

Ou separadamente:

```bash
./mvnw spring-boot:run
```

```bash
npm run tailwind
```

## Build

```bash
./mvnw clean package
```

## Executando o programa após o build
```
java -jar target/chemtools.app-<versão>.jar
``` 
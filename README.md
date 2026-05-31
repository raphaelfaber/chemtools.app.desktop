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

Windows
```bash
./mvnw clean package -Pwindows
```
Linux (default)
```bash
./mvnw clean package -Plinux
```

## Executando o programa após o build
```
java -jar target/chemtools-<sistema>.app-<versão>.jar
``` 

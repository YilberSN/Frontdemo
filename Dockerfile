FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]


# Tercera etapa: ejecutar PostGraphile
FROM node:20-slim
WORKDIR /app
RUN npm install -g postgraphile
EXPOSE 5000
CMD ["postgraphile", "-c", "postgres://demo:faCdrZlBUJFsHmJIRTutgAgeOmlFEVnE@dpg-ciunhediuiedpv0vle40-a.oregon-postgres.render.com/demo_bo9h?ssl=true", "--schema", "public", "--enhance-graphiql", "--dynamic-json", "--cors"]

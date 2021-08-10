# WE DEFINED SCHEMA IN PREVIOUS BRANCH, NOW LET ORDER PRISMA TO CREATE NEW TABLES, BY USING, MENTIONED SCHEMA

BUT WE HAVE ONE PROBLEM AND THAT IS EFAULT SETTING OF PRISMA THAT ENV VARIABLES ARE ONLY TAKEN FROM .env FILE

**WE PLACED `DATABASE_URL` INSIDE .env.local SO WE NEED TO TELL PRISMA TO LOAD ENV VARIABLE FROM .env.local INSTED**

FOR THAT PURPOSE WE WILL INSTALL [`dotenv-cli`](https://www.npmjs.com/package/dotenv-cli)

```
npm i -g dotenv-cli
```

**WE NEED TO INCORPORATE `npx prisma db push` IN OUR SCRIPT WHERE WE WILL DEFINE THAT ENV VARIABLES ARE LOADING FROM .env.local**

```
code package.json
```

```json
"scripts": {
    
  "prisma:db:push": "dotenv -e .env.local -- npx prisma db push"
},
```

## LET' EXECUTE `npx prisma db push`

```
yarn prisma:db:push
```
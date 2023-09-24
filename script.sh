#!/bin/bash

# https://stackoverflow.com/a/13633682/13996389
# https://www.shellcheck.net/

# initialize boiler plate git/github config, prettier, npm, typescript
echo "Step 1: boilerplate files"

cat > .gitattributes << EOF
dist/* linguist-generated
EOF

cat > .gitignore << EOF
node_modules/
dist/
config.json
EOF

cat > .prettierignore << EOF
dist/
node_modules/
EOF


cat > .prettierrc.json << EOF
{
  "singleQuote": true,
  "jsxSingleQuote": true,
  "trailingComma": "es5",
  "tabWidth": 4,
  "semi": true,
  "bracketSpacing": true,
  "printWidth": 100,
  "overrides": [
    {
      "files": ["*.json"],
      "options": {
        "tabWidth": 2
      }
    }
  ]
}
EOF

touch README.md
touch index.html

cat > package.json << EOF
{
  "name": "",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "format": "prettier --write .",
    "build": "esbuild src/script.ts --bundle --outdir=dist",
    "build:watch": "esbuild src/script.ts --bundle --outdir=dist --watch"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {}
}
EOF


mkdir src/

cat > src/script.ts << EOF
console.log("Hello, World!");
EOF


cat > tsconfig.json << EOF
{
  "compilerOptions": {
    "target": "ES2016",
    "lib": ["es2019", "ES6", "es2020", "DOM"],
    "noImplicitAny": true,
    "alwaysStrict": true,
    "strict": true,
    "outDir": "dist",
    "sourceMap": true,
    "moduleResolution": "node",
    "allowSyntheticDefaultImports": true,
    "module": "es6",
    "resolveJsonModule": true
  }
}
EOF

echo "Step 2: initialize git"

git init

echo "Step 3: install packages"

npm install typescript
npm install prettier
npm install esbuild

echo "Step 4: build, format"

npm run build
npm run format

echo "Done"
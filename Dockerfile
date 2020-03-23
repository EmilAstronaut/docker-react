from node:alpine as builder
workdir './app'
copy package.json .
run npm install
copy . .
run npm build

from nginx
copy --from=builder ./app/build /usr/nginx/share/html
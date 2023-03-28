# ----- Builder Stage -----
# as를 통해 다음 FROM까지는 builder stage라는 것을 명시
FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# ----- Run Stage -----
# nginx를 위한 베이스 이미지 명시
FROM nginx

EXPOSE 80

# --from=builder : 다른 Stage에 있는 파일을 복사할 때, 그 Stage 이름을 명시
# /usr/src/app/build : 복사할 파일들의 경로
# /usr/share/nginx/html : 파일들을 붙여넣기할 경로 (nginx가 정적 파일을 제공해주는 경로로, 설정에서 변경 가능)
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
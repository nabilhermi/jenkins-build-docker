FROM nginx:latest
RUN sed -i 's/nginx/nabil/g' /usr/share/nginx/html/index.html
EXPOSE 80

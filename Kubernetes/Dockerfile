# pull the latest official nginx image
FROM nginx:stable
# run docker service on HTTPS
EXPOSE 443
# copy the additional nginx configuration
COPY maintanence.conf /etc/nginx/conf.d/maintanence.conf
# copy ssl pem 
COPY domain.org.pem /etc/nginx/conf.d/domain.org.pem
# copy ssl key
COPY domain.org.key /etc/nginx/conf.d/domain.org.key
# copy static 
COPY index.html /usr/share/nginx/html/index.html
STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]
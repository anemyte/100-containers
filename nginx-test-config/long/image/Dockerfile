FROM nginx
ADD entrypoint-wrapper.sh /
RUN chmod +x /entrypoint-wrapper.sh
ENTRYPOINT ["/entrypoint-wrapper.sh"]
CMD ["nginx", "-g", "daemon off;"]
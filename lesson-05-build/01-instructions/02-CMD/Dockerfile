FROM alpine:3.23.3

ARG nameARG="v1.0"

RUN echo "ARG Value= ${nameARG}" && \
 apk update && \
 apk add nginx && \
 rm -rf /var/cache/apk/*

ENV keyENV=${nameARG}
ENV keyENV2=default
# CMD echo -e "Время: $(date) \nВечер в хату, господа арестанты! (с)"


# CMD echo ${keyENV}
COPY index.html /var/lib/nginx/html/
COPY default.conf /etc/nginx/http.d/

HEALTHCHECK --interval=10s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1

USER 1050: 1050

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
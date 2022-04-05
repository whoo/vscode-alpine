FROM alpine:3.15.4 as builder
RUN apk add build-base python3 git npm nodejs yarn
#RUN git clone --recursive https://github.com/cdr/code-server.git
#RUN cd code-server
#RUN npm install  -g code-server --unsafe-perm
RUN  yarn global add code-server


FROM alpine:3.15.4
RUN apk add py3-pip nodejs
COPY --from=builder /usr/local/share/.config    /usr/local/share/.config
RUN  ln -fs ../share/.config/yarn/global/node_modules/.bin/code-server /usr/local/bin/code-server

RUN adduser -D --shell /bin/bash vscode
USER vscode
ENV PASSWORD=changeme
ENTRYPOINT code-server --bind-addr 0:8443

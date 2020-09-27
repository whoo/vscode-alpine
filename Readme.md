# VsCode on Alpine >> Docker

Just clone it.

<code>
docker build -t vscode .

docker run -d -v FOLDER:/opt  -e PASSWORD=PassW0rd whoo/vscode-alpine
</code>

note: uid in container is 1000 / should be fixed.
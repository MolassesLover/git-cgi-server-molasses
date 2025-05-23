FROM nixos/nix

ENV ADDITIONAL_ARGS=""
ENV ADDRESS=""
ENV PORT="8080"
ENV URI_PREFIX="/"

COPY . /opt/source
WORKDIR /opt/source

RUN nix \
    --extra-experimental-features nix-command \
    --extra-experimental-features flakes \
    profile install . ".#git-cgi-server-molasses"

WORKDIR /opt/workdir

CMD git-cgi-server \
    -addr "$ADDRESS:$PORT" \
    -uri-prefix "$URI_PREFIX" \
    $ADDITIONAL_ARGS

FROM gcc AS build
WORKDIR /src/
RUN apt-get update && apt-get install -y flex
COPY ./ /src/
RUN make LDFLAGS=-static

FROM scratch  as calc
COPY --from=build /src/calc /usr/bin/calc
CMD ["/usr/bin/calc"]
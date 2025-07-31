# Builder
FROM brew.registry.redhat.io/rh-osbs/openshift-golang-builder:rhel_9_golang_1.23 as builder

WORKDIR /go/src/app
COPY main.go .

RUN go build -o /go/bin/app

# Container image
FROM registry.redhat.io/ubi9/ubi-minimal

COPY --from=builder /go/bin/app /usr/local/bin/app

CMD ["/usr/local/bin/app"]

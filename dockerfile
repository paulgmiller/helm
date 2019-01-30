FROM golang:latest 
#install glide
RUN apt update && apt install golang-glide
COPY ./glide.lock /go/src/k8s.io/helm/glide.lock
COPY ./glide.yaml /go/src/k8s.io/helm/glide.yaml
COPY ./Makefile /go/src/k8s.io/helm/Makefile
COPY ./versioning.mk /go/src/k8s.io/helm/versioning.mk
WORKDIR /go/src/k8s.io/helm
RUN make bootstrap
COPY . /go/src/k8s.io/helm
RUN make build
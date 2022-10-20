FROM alpine:3.16.2

ENV KUSTOMIZE_VER 4.5.7
ENV KUBECTL_VER 1.25.3
ENV HELM_VER 3.10.1

RUN apk --no-cache add curl gettext

RUN mkdir /working
WORKDIR /working

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64  -o /usr/bin/kustomize \
    && chmod +x /usr/bin/kustomize

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl

RUN curl -L https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz -o helm.tar.gz \
    && tar -zxvf helm.tar.gz linux-amd64/helm \
    && mv linux-amd64/helm /usr/bin/helm \
    && rm -r linux-amd64 \
    && rm -r helm.tar.gz
FROM python:3.13-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-client \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install --no-cache-dir \
    ansible==14.4.0 \
    ansible-lint \
    yamllint

COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh

RUN sed -i 's/\r$//' /usr/local/bin/entrypoint.sh

WORKDIR /ansible

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

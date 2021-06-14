ARG BASE_VERSION="v4"
ARG SPARK_VERSION
ARG HADOOP_VERSION
ARG SCALA_VERSION
ARG PYTHON_VERSION

# Base image
FROM dsaidgovsg/spark-k8s-addons:${BASE_VERSION}_${SPARK_VERSION}_hadoop-${HADOOP_VERSION}_scala-${SCALA_VERSION}_python-${PYTHON_VERSION}

USER root

# Install all dependencies for data science work
RUN set -euo pipefail && \
    ## Required system dependencies for pip install
    apt-get update && apt-get install --no-install-recommends -y \
        build-essential \
        libgeos-dev \
        ; \
    rm -rf /var/lib/apt/lists/*; \
    ## Pip install
    pushd "${POETRY_SYSTEM_PROJECT_DIR}"; \
    poetry add \
        "attrs==20.3.*" \
        "croniter==0.3.*" \
        "matplotlib==3.2.*" \
        "numpy==1.17.*" \
        "pandas==0.25.*" \
        "pendulum==2.1.2" \
        "pyjwt==1.7.*" \
        "pyproj==1.9.*" \
        "python-dateutil==2.8.*" \
        "requests==2.22.*" \
        "shapely==1.6.*" \
    popd; \
    :

USER ${SPARK_USER}

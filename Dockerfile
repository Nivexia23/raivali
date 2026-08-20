# syntax=docker/dockerfile:1
# Raivali panel — single-image Railway build (source is bundled, no network clone at build time)
ARG PYTHON_VERSION=3.14
FROM ghcr.io/astral-sh/uv:python$PYTHON_VERSION-bookworm-slim AS builder
ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy UV_PYTHON_DOWNLOADS=0

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc python3-dev libc6-dev git curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"

WORKDIR /code
COPY . .

# Build the dashboard static bundle (final image has no bun, so it must exist here)
RUN cd dashboard && bun install --frozen-lockfile && cd .. && bash build_dashboard.sh

RUN uv sync --frozen --no-dev

FROM python:$PYTHON_VERSION-slim-bookworm
COPY --from=builder /code /code
WORKDIR /code
ENV PATH="/code/.venv/bin:$PATH"

RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /code/start.sh /code/start-railway.sh

EXPOSE 8000
ENTRYPOINT ["/code/start-railway.sh"]

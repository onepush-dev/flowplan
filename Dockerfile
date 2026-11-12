# Flowplan on Railway. The Railway template runs the official image ghcr.io/yannicschuller/flowplan:0.9.4
# (AGPL-3.0) directly; Railway injects PORT=8080 and the domain targets 8080.
# This Dockerfile is the same image for deploying from this repo: unmodified, only PORT pinned to 8080.
FROM ghcr.io/yannicschuller/flowplan:0.9.4
ENV PORT=8080 \
    FLOWPLAN_DATA_DIR=/app/data
EXPOSE 8080

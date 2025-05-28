FROM ghcr.io/developmentseed/titiler:latest

# CORS settings
ENV TITILER_API_CORS_ORIGINS=*
ENV TITILER_API_CORS_ALLOW_METHODS=GET,POST,OPTIONS

# Proxy settings for HTTPS detection
ENV FORWARDED_ALLOW_IPS=*
ENV TITILER_API_ROOT_PATH=""

EXPOSE 7860

CMD ["uvicorn", "titiler.application.main:app", "--host", "0.0.0.0", "--port", "7860", "--workers", "1", "--proxy-headers", "--forwarded-allow-ips", "*"]
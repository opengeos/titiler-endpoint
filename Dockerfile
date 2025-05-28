FROM ghcr.io/developmentseed/titiler:latest

# Optional: Set CORS options (defaults to "*", so only needed if customizing)
ENV TITILER_API_CORS_ORIGINS=*
ENV TITILER_API_CORS_ALLOW_METHODS=GET,POST,OPTIONS

EXPOSE 7860

CMD ["uvicorn", "titiler.application.main:app", "--host", "0.0.0.0", "--port", "7860", "--workers", "1"]

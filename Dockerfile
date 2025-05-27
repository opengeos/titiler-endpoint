FROM ghcr.io/developmentseed/titiler:latest

EXPOSE 7860

CMD ["uvicorn", "titiler.application.main:app", "--host", "0.0.0.0", "--port", "7860", "--workers", "1"]

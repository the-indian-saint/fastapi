import logging

from fastapi import FastAPI

from tree_api.routers.trees import tree_router


class HealthEndpointAccessLogFilter(logging.Filter):
    def filter(self, record: logging.LogRecord) -> bool:
        return record.getMessage().find("/health") == -1


# Filter out log entries for /health
logging.getLogger("uvicorn.access").addFilter(HealthEndpointAccessLogFilter())

app = FastAPI()


@app.get("/health")
async def health():
    return "OK"

app.include_router(tree_router, prefix="/api", tags=["trees"])

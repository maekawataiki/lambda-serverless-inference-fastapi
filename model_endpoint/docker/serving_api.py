import json
import logging
from fastapi import FastAPI
from mangum import Mangum

logger = logging.getLogger()
logger.setLevel(logging.INFO)

app = FastAPI(root_path="/prod")


@app.get("/")
async def root() -> dict:
    """
    **Dummy endpoint that returns 'hello world' example.**

    ```
    Returns:
        dict: 'hello world' message.
    ```
    """
    return {"message": "Hello World"}

def lambda_handler(event, context):
    logger.info(json.dumps(event))

    asgi_handler = Mangum(app)
    response = asgi_handler(
        event, context
    )  # Call the instance with the event arguments

    logger.info(json.dumps(response))
    return response

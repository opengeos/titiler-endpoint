from fastapi import FastAPI
from titiler.core.factory import TilerFactory
from titiler.stac.factory import STACTilerFactory
from titiler.mosaic.factory import MosaicTilerFactory
from titiler.mosaic.routes import MosaicRouter
from titiler.core.dependencies import DefaultDependency
from starlette.middleware.cors import CORSMiddleware

app = FastAPI()

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Use specific domains in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ---- COG Tiler ----
cog = TilerFactory()
app.include_router(cog.router, tags=["Cloud Optimized GeoTIFF"])

# ---- STAC Tiler ----
stac = STACTilerFactory()
app.include_router(stac.router, prefix="/stac", tags=["STAC Items"])

# ---- MosaicJSON Tiler ----
mosaic = MosaicTilerFactory()
app.include_router(mosaic.router, prefix="/mosaic", tags=["MosaicJSON"])


# (Optional) Add a root endpoint
@app.get("/")
def read_index():
    return {"message": "Welcome to TiTiler with COG, STAC, and Mosaic support"}

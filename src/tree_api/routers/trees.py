from fastapi import APIRouter

from typing import List

from tree_api.model.tree import Tree

tree_router = APIRouter()


@tree_router.get("/tree", response_model=List[Tree])
async def get_tree():
    return [Tree(My_Favourite_Tree="Mango!!")]

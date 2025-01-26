package com.example.kotlinretro.model

data class ProductsDataList(
    val limit: Int,
    val products: List<Product>,
    val skip: Int,
    val total: Int
)
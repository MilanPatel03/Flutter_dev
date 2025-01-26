package com.example.kotlinretro.network

import com.example.kotlinretro.model.ProductsDataList
import retrofit2.http.GET
import retrofit2.http.Query

interface ApiService {

    @GET("products")
    suspend fun getProducts(
        @Query("limit") limit: Int,
        @Query("skip") skip: Int
    ): ProductsDataList
}
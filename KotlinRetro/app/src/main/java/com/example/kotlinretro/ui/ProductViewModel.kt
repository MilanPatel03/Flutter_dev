package com.example.kotlinretro.ui

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.kotlinretro.model.ProductsDataList
import com.example.kotlinretro.network.RetrofitInstance
import kotlinx.coroutines.launch

class ProductViewModel: ViewModel() {

    private val _productsDataList = MutableLiveData<ProductsDataList>()
    val productsDataList: LiveData<ProductsDataList> get() = _productsDataList

    private val _errorMessage = MutableLiveData<String>()
    val errorMessage: LiveData<String> get() = _errorMessage

    fun getProducts(limit: Int, skip: Int) {
        viewModelScope.launch {
            try {
                val response = RetrofitInstance.apiService.getProducts(limit, skip)
                if (response != null) {
                    _productsDataList.postValue(response)
                }
            } catch (e: Exception) {
                Log.e("ProductViewModel", "Error: ${e.message}")
                _errorMessage.postValue("Failed to load products.")
            }
        }
    }
}
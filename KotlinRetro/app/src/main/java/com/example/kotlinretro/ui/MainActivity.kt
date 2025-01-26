package com.example.kotlinretro.ui

import android.os.Bundle
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.kotlinretro.R
import com.example.kotlinretro.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private val productViewModel: ProductViewModel by viewModels()
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Initialize ViewBinding
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Set up RecyclerView
        binding.rvProducts.layoutManager = LinearLayoutManager(this)

        // Observe data from ViewModel
        productViewModel.productsDataList.observe(this, { productsDataList ->
            val products = productsDataList.products
            // Update RecyclerView adapter with new data
            binding.rvProducts.adapter = ProductAdapter(products)
        })

        // Observe errors
        productViewModel.errorMessage.observe(this, { errorMessage ->
            Toast.makeText(this, errorMessage, Toast.LENGTH_SHORT).show()
        })

        // Fetch products
        productViewModel.getProducts(limit = 10, skip = 0)
    }
}
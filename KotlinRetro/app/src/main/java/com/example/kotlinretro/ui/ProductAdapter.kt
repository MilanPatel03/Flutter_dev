package com.example.kotlinretro.ui

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.kotlinretro.R
import com.example.kotlinretro.databinding.ItemProductBinding
import com.example.kotlinretro.model.Product
import com.squareup.picasso.Picasso


class ProductAdapter(private val products: List<Product>) : RecyclerView.Adapter<ProductAdapter.ProductViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProductViewHolder {
        val binding = ItemProductBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return ProductViewHolder(binding)
    }

    override fun onBindViewHolder(holder: ProductViewHolder, position: Int) {
        val product = products[position]
        holder.bind(product)
    }

    override fun getItemCount(): Int = products.size

    class ProductViewHolder(private val binding: ItemProductBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(product: Product) {
            binding.productReturnPolicy.text = product.returnPolicy
            binding.productTitle.text = product.title
            binding.productPrice.text = "$${product.price}"
            Picasso.get().load(product.images.firstOrNull()).into(binding.productImage)
        }
    }
}

package com.example.serviceapp

import ViewPagerAdapter
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.viewpager2.widget.ViewPager2


class MainActivity : AppCompatActivity() {

    private lateinit var btnStart : Button
    private lateinit var btnStop: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btnStart = findViewById(R.id.startBtn)
        btnStop = findViewById(R.id.stopBtn)

        // Using Lambda for OnClickListener
        btnStart.setOnClickListener {
            startService(Intent(this, MusicService::class.java))
        }

        btnStop.setOnClickListener {
            stopService(Intent(this, MusicService::class.java))
        }


        // Data for our ViewPager
        val pageList = listOf(
            PageItem(Color.RED, "Welcome to Page 1!"),
            PageItem(Color.BLUE, "This is Page 2!"),
            PageItem(Color.GREEN, "This is Page 3!")
        )
        // Set up ViewPager with the adapter
        val viewPager: ViewPager2 = findViewById(R.id.viewPager)
        viewPager.adapter = ViewPagerAdapter(pageList)
    }
}
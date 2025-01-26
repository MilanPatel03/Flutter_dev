package com.example.serviceapp

import android.app.Service
import android.content.Intent
import android.media.MediaPlayer
import android.os.IBinder
import android.provider.Settings

class MusicService : Service() {

    private lateinit var mp : MediaPlayer

    override fun onBind(intent: Intent?): IBinder? {
        TODO("Not yet implemented")
        return null
    }


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        mp = MediaPlayer.create(this, Settings.System.DEFAULT_RINGTONE_URI)

        mp.isLooping = true
        mp.start()
        return START_NOT_STICKY

    }

    override fun onDestroy() {

        mp.stop()
        super.onDestroy()
    }

}
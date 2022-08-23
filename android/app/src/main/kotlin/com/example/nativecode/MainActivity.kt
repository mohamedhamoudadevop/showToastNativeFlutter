package com.example.nativecode

import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example.nativecode/toast";
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, result ->
            var argument = call.arguments() as Map<String, String?>?;
            var message = argument?.get("message");
            if (call.method == "showToast") {
                Log.d("TAG", "message");
                Toast.makeText(this, message, Toast.LENGTH_LONG).show()
            }
        }
    }
}

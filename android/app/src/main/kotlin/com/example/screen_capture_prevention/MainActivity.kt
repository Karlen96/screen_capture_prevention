package com.example.screen_capture_prevention

import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val SCREEN_ACTIONS_CHANNEL = "screen.actions"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            SCREEN_ACTIONS_CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {
                "makeSecure" -> {
                    window.addFlags(LayoutParams.FLAG_SECURE)
                    result.success(true)
                }

                "disableSecure" -> {
                    window.clearFlags(LayoutParams.FLAG_SECURE)
                    result.success(true)
                }

                else -> result.notImplemented()
            }
        }
    }
}
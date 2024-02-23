package com.example.appnation_casestudy

import io.flutter.embedding.android.FlutterActivity
import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {
    private val CHANNEL = "channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getOsVersion") {
                result.success(Build.VERSION.RELEASE)
            } else {
                result.notImplemented()
            }
        }
    }
}

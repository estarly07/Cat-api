package com.example.cat_api

import android.content.ComponentName
import android.content.pm.PackageManager
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        val methodChannel = MethodChannel(messenger,"app.cat_api/platfom_channel")
        methodChannel.setMethodCallHandler{ call,result ->
            when(call.method){
                "change_logo" ->{
                    Log.i("TAG","${call.argument<Boolean>("changeApk")}")
                    try {
                       changeIcon(call.argument<Boolean>("changeApk")!!)
                    }catch (e:Exception){}
                }

            }
        }
    }
    private fun changeIcon(isDark : Boolean) {

        val manager = packageManager
        manager.setComponentEnabledSetting(
            ComponentName(
                this@MainActivity,
                if (isDark)
                    "$packageName.MainActivityDark"
                else
                    "$packageName.MainActivity"
            ),
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
            PackageManager.DONT_KILL_APP
        )

        // disable new icon
        manager.setComponentEnabledSetting(
            ComponentName(
                this@MainActivity,
                if (isDark)
                    "$packageName.MainActivity"
                else
                    "$packageName.MainActivityDark"
            ),
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
            PackageManager.DONT_KILL_APP
        )
    }

}

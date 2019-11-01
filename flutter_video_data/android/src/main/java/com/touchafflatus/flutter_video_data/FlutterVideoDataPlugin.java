package com.touchafflatus.flutter_video_data;

import android.content.Context;

import com.touchafflatus.flutter_video_data.bean.Video;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterVideoDataPlugin
 */
public class FlutterVideoDataPlugin implements MethodCallHandler {
    private static Context _applicationContext;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_video_data");
        channel.setMethodCallHandler(new FlutterVideoDataPlugin());
        _applicationContext = registrar.context().getApplicationContext();
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case "getVideos":
                getVideos(call, result);
                break;
            default:
                result.notImplemented();
        }
    }

    void getVideos(MethodCall call, final Result result) {
        List<Video> videos = FileManager.getInstance(_applicationContext).getVideos();
        if (videos == null) {
            result.error("getvideoserror", "null", null);
        } else {
            ConstraintsMap cm = new ConstraintsMap();
            //System.out.println("=================>>>>3");
            for (int i = 0; i < videos.size(); i++) {
                Video v = videos.get(i);
                //System.out.println("=================>>>>5" + v.getName());

                ArrayList arrayList = new ArrayList();
                arrayList.add(v.getPath());
                arrayList.add(v.getName());
                arrayList.add(v.getId());
                arrayList.add(v.getSize());
                cm.putArray(String.valueOf(i), arrayList);
            }
            //System.out.println("=================>>>>6");

            result.success(cm.toMap());
        }
    }
}

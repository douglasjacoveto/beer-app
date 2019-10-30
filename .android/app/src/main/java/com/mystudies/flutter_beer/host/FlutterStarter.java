package com.mystudies.flutter_beer.host;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import com.mystudies.core.CoreApplication;
import com.mystudies.core.CoreObservable;
import com.mystudies.core.GlobalObservers;

import java.util.Observable;
import java.util.Observer;

public class FlutterStarter extends CoreObservable implements Observer {

    public FlutterStarter init(Context context, CoreApplication coreApplication) {
        this.addObserver(this);

        coreApplication.addModuleObservable(GlobalObservers.Modules.FLUTTER, this);

        Toast.makeText(context, "Core - FlutterMainApplication has been loaded.", Toast.LENGTH_LONG).show();

        return this;
    }

    @Override
    public void update(Observable o, Object arg) {
        if (arg instanceof Activity) {
            initializer((Activity) arg);
        }
    }

    private void initializer(Context context) {
        Activity activity = (Activity) context;
        Intent intent = new Intent(activity, MainActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.putExtra("route", "beer");
        activity.startActivity(intent);
    }
}

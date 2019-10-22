package io.flutter.facade;

import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.Toast;

import com.mystudies.core.CoreApplication;
import com.mystudies.core.CoreObservable;
import com.mystudies.core.GlobalObservers;
import com.mystudies.core.model.FlutterActivityForResultModel;

import java.util.Observable;
import java.util.Observer;

import io.flutter.view.FlutterView;

public class BeerApplication extends CoreObservable implements Observer {

    public BeerApplication init(Context context, CoreApplication coreApplication) {
        this.addObserver(this);

        coreApplication.addModuleObservable(GlobalObservers.Modules.FLUTTER, this);

        Toast.makeText(context, "Core - FlutterMainApplication has been loaded.", Toast.LENGTH_LONG).show();

        return this;
    }

    @Override
    public void update(Observable o, Object arg) {
        if (arg instanceof FlutterActivityForResultModel) {
            Activity activity = ((FlutterActivityForResultModel) arg).getActivity();

            FlutterView flutterView = Flutter.createView(activity, ((FlutterActivityForResultModel) arg).getLifecycle(), "");

            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);

            activity.addContentView(flutterView, layoutParams);
        }
    }
}

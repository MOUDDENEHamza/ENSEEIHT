package com.hamza.webbrowser;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "Browser Activity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.d(TAG, "OnCreate() called!");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // get the reference to the "address" button
        Button goButton = (Button) findViewById(R.id.go);
        // set a callback for the button
        goButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                // function that launch the intent
                go();
            }
        });
    }

    protected void go() {
        Log.i("go to web page", "");
        // get the reference to the edit text
        EditText address = (EditText) findViewById(R.id.address);
        // prepare the intent
        Intent URIIntent = new Intent(Intent.ACTION_VIEW);
        // set data
        URIIntent.setData(Uri.parse(address.getText().toString()));
        // start the activity
        startActivity(URIIntent);
    }
}
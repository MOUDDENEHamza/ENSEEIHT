package fr.enseeiht.hmoudden.player;

import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.TextView;

import java.io.IOException;

public class MainActivity extends AppCompatActivity implements View.OnClickListener, SurfaceHolder.Callback {

    private static final String TAG = "Video Player";
    private static final int SELECT_VIDEO = 100;
    private Button select;
    private Button play;
    private Button playFromStart;
    private Button pauseOrResume;
    private SurfaceHolder surfaceHolder;
    private MediaPlayer mediaPlayer;
    private int currentPosition;
    private SeekBar progressBar;
    private BarUpdateTask updateTask;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        select = findViewById(R.id.select);
        play = findViewById(R.id.play);
        playFromStart = findViewById(R.id.playFromStart);
        pauseOrResume = findViewById(R.id.PauseOrResume);

        progressBar = this.findViewById(R.id.progressBar);
        progressBar.setEnabled(false);
        progressBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if(fromUser) {
                    if(mediaPlayer.isPlaying())
                        mediaPlayer.seekTo(progress);
                    else{
                        mediaPlayer.start();
                        mediaPlayer.seekTo(progress);
                        mediaPlayer.pause();
                    }
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        select.setOnClickListener(this);
        play.setOnClickListener(this);
        playFromStart.setOnClickListener(this);
        pauseOrResume.setOnClickListener(this);

        play.setEnabled(false);
        playFromStart.setEnabled(false);
        pauseOrResume.setEnabled(false);

        // recover the SurfaceView from resources
        SurfaceView surfaceView = findViewById(R.id.surfaceView);

        // Get the surfaceHolder from it
        surfaceHolder = surfaceView.getHolder();

        // and assign to it the call back this class implements
        surfaceHolder.addCallback(this);

        // this is a compatibility check, setType has been deprecated since HoneyComb,
        // it guarantees back compatibility
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.HONEYCOMB)
            surfaceHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);

        mediaPlayer = new MediaPlayer();
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.select) {
            // Create the intent
            Intent selectIntent = new Intent(Intent.ACTION_PICK);
            // set data
            selectIntent.setDataAndType(android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI, "video/*");
            // start the activity
            startActivityForResult(selectIntent, SELECT_VIDEO);
        } else if (v.getId() == R.id.play) {
            // Create the intent
            Intent playIntent = new Intent(Intent.ACTION_VIEW);
            // set data
            TextView value = findViewById(R.id.value);
            playIntent.setData(Uri.parse(value.getText().toString()));
            // start the activity
            startActivity(playIntent);
        } else if (v.getId() == R.id.playFromStart) {
            try {
                mediaPlayer.reset();
                TextView value = findViewById(R.id.value);
                mediaPlayer.setDataSource(this, Uri.parse(value.getText().toString()));
                mediaPlayer.prepare();
                mediaPlayer.start();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (v.getId() == R.id.PauseOrResume) {
            if (mediaPlayer.isPlaying()) {
                mediaPlayer.pause();
            } else {
                mediaPlayer.start();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
        try {
            super.onActivityResult(requestCode, resultCode, intent);

            if (resultCode == RESULT_OK && requestCode == SELECT_VIDEO) {
                String videoUri = intent.getData().toString();

                TextView text = findViewById(R.id.value);
                Log.d(TAG, videoUri);
                text.setText(videoUri);
                play.setEnabled(true);
            }
        } catch (Exception ex) {
            ex.getStackTrace();
        }
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        mediaPlayer.setDisplay(surfaceHolder);
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {

    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {

    }

    @Override
    protected void onPause() {
        super.onPause();
        TextView value = findViewById(R.id.value);
        if(value.getText().toString() != null && mediaPlayer != null){
            currentPosition = mediaPlayer.getCurrentPosition();
            mediaPlayer.reset();
            mediaPlayer.release();
            mediaPlayer = null;
            if(updateTask != null)
                updateTask.cancel(true);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        TextView value = findViewById(R.id.value);
        try {
            if(value.getText().toString() != null && currentPosition > 0){
                mediaPlayer = new MediaPlayer();
                mediaPlayer.setDataSource(this, Uri.parse(value.getText().toString()));
                mediaPlayer.prepare();
                mediaPlayer.seekTo(currentPosition);
                updateTask = new BarUpdateTask();
                updateTask.execute(progressBar);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private class BarUpdateTask extends AsyncTask<SeekBar, Integer, Void> {
        @Override
        protected Void doInBackground(SeekBar... seekBars) {
            while(!isCancelled()){
                publishProgress(mediaPlayer.getCurrentPosition());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            return null;
        }

        @Override
        protected void onProgressUpdate(Integer... values) {
            progressBar.setProgress(mediaPlayer.getCurrentPosition());
        }
    }
}

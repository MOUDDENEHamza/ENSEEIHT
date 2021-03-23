package fr.enseeiht.gasparini.videocaptureintent;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore.Video.Media;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.VideoView;

public class MainActivity extends Activity implements OnClickListener
{
	private VideoView vidView;
	
	private Button captButton;
	private Button playButton;
	
	// the code request for the activity to start
	final static int CAMERA_RESULT = 99;
	
	private Uri videoFileUri;
	@Override
	protected void onCreate( Bundle savedInstanceState )
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );

		// retrieve all the buttons and set the listener
		captButton = (Button) this.findViewById( R.id.CaptureVideoButton );
		playButton = (Button) this.findViewById( R.id.PlayVideoButton );

		captButton.setOnClickListener( this );
		playButton.setOnClickListener( this );

		// at the beginning the play button is disabled
		playButton.setEnabled( false );
		
		vidView = (VideoView) this.findViewById( R.id.VideoView );
	}
	
	@Override
	public void onClick( View v )
	{
		if( v.getId() == captButton.getId() )
		{
			// first get a new filename from the media provider
			videoFileUri = getContentResolver().insert( Media.EXTERNAL_CONTENT_URI, new ContentValues() );
			
			Intent captureVideoIntent = new Intent( android.provider.MediaStore.ACTION_VIDEO_CAPTURE );
			captureVideoIntent.putExtra( android.provider.MediaStore.EXTRA_OUTPUT, videoFileUri );
			
			startActivityForResult( captureVideoIntent, CAMERA_RESULT );
		}
		else if( v.getId() == playButton.getId() )
		{
			Log.i( "videio", videoFileUri.toString() );
			vidView.setVideoURI( videoFileUri );
			vidView.start();
		}
		
	}
	
	@Override
	protected void onActivityResult( int requestCode, int resultCode,
			Intent data )
	{
		if( resultCode == RESULT_OK && requestCode == CAMERA_RESULT )
		{
			videoFileUri = data.getData();
			Log.i( "videio2", videoFileUri.toString() );
			
			// now the button can be used
			playButton.setEnabled( true );
		}
	}
}

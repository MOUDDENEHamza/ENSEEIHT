package fr.enseeiht.gasparini.resultcameraintent;


import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends Activity implements OnClickListener
{
	private ImageView imv;
	
	private Button mShotButton;
	// the code request for the activity to start
	final static int CAMERA_RESULT = 99;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );
		// get the reference of the button from resources
		mShotButton = (Button) findViewById( R.id.shotbutton );
		// set the callback for the button
		mShotButton.setOnClickListener( this );
	}
	
	@Override
	public void onClick(View v)
	{
		Intent newInt = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
		startActivityForResult(newInt, CAMERA_RESULT);
	}
	
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent intent)
	{
		super.onActivityResult( requestCode, resultCode, intent );
		// if the request code is the same as the one used to start the activity
		// and the user has actually taken a picture
		if ( resultCode == RESULT_OK && requestCode == CAMERA_RESULT )
		{
			// get the image from the "extras" of the result intent
			Bundle extras = intent.getExtras();
			Bitmap bmp = (Bitmap) extras.get( "data" );
			// set the result image to the ImageView widget
			imv = (ImageView) findViewById( R.id.ReturnedImageView );
			imv.setImageBitmap( bmp );
		}
	}

}

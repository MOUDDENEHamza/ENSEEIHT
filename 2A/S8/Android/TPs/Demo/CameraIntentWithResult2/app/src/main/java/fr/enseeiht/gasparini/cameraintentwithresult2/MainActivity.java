package fr.enseeiht.gasparini.cameraintentwithresult2;

import java.io.FileNotFoundException;

import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore.Images.Media;
import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.Display;
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
	
	private Uri imageFileUri;

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
		// first get a new filename from the media provider
		imageFileUri = getContentResolver().insert( Media.EXTERNAL_CONTENT_URI, new ContentValues() );
		
		// create the intent
		Intent newInt = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
		// add the filename to assign to the taken picture as extra
		newInt.putExtra( android.provider.MediaStore.EXTRA_OUTPUT, imageFileUri );
		
		startActivityForResult(newInt, CAMERA_RESULT);
	}
	
	@SuppressWarnings("deprecation")
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent intent)
	{
		super.onActivityResult( requestCode, resultCode, intent );
		// if the request code is the same as the one used to start the activity
		// and the user has actually taken a picture
		if ( resultCode == RESULT_OK && requestCode == CAMERA_RESULT )
		{
			// easy way to get the image visualized at screen full width
			// we get the display
			Display curr = getWindowManager().getDefaultDisplay();
			
			// options to pass when opening the image
			BitmapFactory.Options bmpOptions = new BitmapFactory.Options();
			
			// set the scaled image width to the size of the display
			bmpOptions.outWidth = curr.getWidth();
			
			try
			{
				Bitmap bmp = BitmapFactory.decodeStream( getContentResolver().openInputStream( imageFileUri ), null, bmpOptions );

				// set the result image to the ImageView widget
				imv = (ImageView) findViewById( R.id.ReturnedImageView );
				imv.setImageBitmap( bmp );
			}
			catch( FileNotFoundException e )
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}


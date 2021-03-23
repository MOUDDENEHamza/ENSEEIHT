package fr.enseeiht.fr.camerasimplepreview;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.hardware.Camera;
import android.os.Bundle;
import android.util.Log;
import android.widget.FrameLayout;

public class MainActivity extends Activity
{
	private static final String TAG = "MainActivity";
	private Camera mCamera;
	private CameraPreview mPreview;

	@Override
	public void onCreate( Bundle savedInstanceState )
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );

		// Create an instance of Camera
		Log.e( TAG, "camera? " + checkCameraHardware( this ) );
//		mCamera = getCameraInstance();
//		if( mCamera == null)
//			Log.e( TAG, "camera null" );
//
//		// Create our Preview view and set it as the content of our activity.
//		mPreview = new CameraPreview( this, mCamera );
//		FrameLayout preview = (FrameLayout) findViewById( R.id.cameraPreview );
//		preview.addView( mPreview );
	}

	@Override
	protected void onPause()
	{
		super.onPause();
		releaseCamera(); // release the camera immediately on pause event
	}
	
	@Override
	protected void onResume()
	{
		// TODO Auto-generated method stub
		super.onResume();
		mCamera = getCameraInstance();
		if( mCamera == null)
			Log.e( TAG, "camera null" );
		mPreview = new CameraPreview( this, mCamera );
		FrameLayout preview = (FrameLayout) findViewById( R.id.cameraPreview );
		preview.addView( mPreview );
	}

	private void releaseCamera()
	{
		if( mCamera != null )
		{
			mCamera.release(); // release the camera for other applications
			mCamera = null;
		}
	}

	/** A safe way to get an instance of the Camera object. */
	public static Camera getCameraInstance()
	{
		Camera c = null;
		try
		{
			c = Camera.open( 0 ); // attempt to get a Camera instance
			Log.d( TAG, "camera opened");
		}
		catch( Exception e )
		{
			// Camera is not available (in use or does not exist)
			Log.d( TAG, "Error starting camera: " + e.getMessage() );
		}
		return c; // returns null if camera is unavailable
	}

	/** Check if this device has a camera */
	private boolean checkCameraHardware( Context context )
	{
		if( context.getPackageManager().hasSystemFeature(
				PackageManager.FEATURE_CAMERA ) )
		{
			// this device has a camera
			return true;
		}
		else
		{
			// no camera on this device
			return false;
		}
	}
}

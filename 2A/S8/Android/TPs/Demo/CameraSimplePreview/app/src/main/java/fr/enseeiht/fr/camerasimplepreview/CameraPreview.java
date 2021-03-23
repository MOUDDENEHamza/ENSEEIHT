package fr.enseeiht.fr.camerasimplepreview;

import android.content.Context;
import android.hardware.Camera;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class CameraPreview extends SurfaceView implements
		SurfaceHolder.Callback
{
	private final String TAG = "CameraPreview";
	private SurfaceHolder mHolder;
	private Camera mCamera;
	
	public CameraPreview( Context context, Camera camera )
	{
		super( context );
		mCamera = camera;
		// Install a SurfaceHolder.Callback so we get notified when the
		// underlying surface is created and destroyed.
		mHolder = getHolder();
		mHolder.addCallback( this );
		// deprecated setting, but required on Android versions <3.0
		mHolder.setType( SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS );
	}

	@Override
	public void surfaceChanged( SurfaceHolder holder, int format, int width,
			int height )
	{
		Log.d( TAG, "surfaceChanged with w " + width + " and h " + height );
		// If your preview can change or rotate, take care of those events here.
		// Make sure to stop the preview before resizing or reformatting it.

		if( mHolder.getSurface() == null )
		{
			// preview surface does not exist
			return;
		}

		// stop preview before making changes
		try
		{
			// mCamera.stopPreview();
		}
		catch( Exception e )
		{
			// ignore: tried to stop a non-existent preview
			Log.d( TAG, e.getMessage() );
		}

		// set preview size and make any resize, rotate or
		// reformatting changes here

		// start preview with new settings
		try
		{
			 mCamera.setPreviewDisplay( mHolder );
			 mCamera.startPreview();
		}
		catch( Exception e )
		{
			Log.d( TAG, "Error starting camera preview: " + e.getMessage() );
		}

	}

	@Override
	public void surfaceCreated( SurfaceHolder holder )
	{
		// The Surface has been created, now tell the camera where to
		// draw the preview.
		// try
		// {
		// if( mCamera == null)
		// Log.e( TAG, "camera null" );
		// mCamera.setPreviewDisplay( holder );
		// mCamera.startPreview();
		// }
		// catch( IOException e )
		// {
		// Log.d( TAG, "Error setting camera preview: " + e.getMessage() );
		// }

	}

	@Override
	public void surfaceDestroyed( SurfaceHolder holder )
	{

	}


}

package fr.enseeiht.gasparini.simplecameraintent;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener 
{

	private Button mShotButton;
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );
		// get the reference to the button from the resources
		mShotButton = (Button) findViewById( R.id.shotbutton );
		// set the call back listener
		mShotButton.setOnClickListener( this );
		
	}

	@Override
	public void onClick( View v )
	{
		// new intent to capture a photo
		Intent newInt = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
		startActivity( newInt );
	};

}



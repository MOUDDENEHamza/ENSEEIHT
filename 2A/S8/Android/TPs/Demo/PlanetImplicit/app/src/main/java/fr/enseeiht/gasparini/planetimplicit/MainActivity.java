package fr.enseeiht.gasparini.planetimplicit;


import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity implements OnClickListener
{

	private static final String TAG = "MainActivity";

	private static final int GET_PLANET = 108;

	private Button mResultStartButton;

	private TextView mResultView;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );
		
		// get the reference of all the graphical widget
		mResultStartButton = (Button) findViewById( R.id.resultbutton );
	
		mResultView = (TextView) findViewById( R.id.resultFromActivityView );
		
		// set the listener for the two buttons
		// we use the same listener callback for both buttons, we will check inside
		// which one has been pressed
		mResultStartButton.setOnClickListener( this );
	
	}

	@Override
	public void onClick(View v)
	{	
		if ( v.getId() == mResultStartButton.getId() )
		{
			Log.i( TAG, "Button Result pressed" );
			// set the implicit intent and launch the activity
			Intent newInt = new Intent();
			newInt.setAction( Intent.ACTION_PICK );
//			newInt.setAction( Intent.ACTION_GET_CONTENT );
			newInt.setType( "text/plain" );
//			startActivityForResult( newInt, GET_PLANET );
			
			Intent chooser = Intent.createChooser(newInt, "App for choosing a planet");

			// Verify the intent will resolve to at least one activity
			if (chooser.resolveActivity(getPackageManager()) != null) {
				startActivityForResult( chooser, GET_PLANET );
			}
		}
	
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data)
	{
		super.onActivityResult( requestCode, resultCode, data );

		// if the request code is the same we used to start the activity and there is
		// a positive result
		if ( requestCode == GET_PLANET && resultCode == RESULT_OK )
		{
			mResultView.setText( data.getExtras().getString( "ChoosenPlanet" ) );
		}
		
		if(resultCode != RESULT_OK)
		{
			Log.i( TAG, "Returned without ok result" );
		}
	}

}

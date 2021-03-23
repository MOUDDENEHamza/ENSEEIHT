package fr.enseeiht.gasparini.intentdemo;

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

	private Button mSimplyStartButton;
	private Button mResultStartButton;

	private TextView mResultView;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );
		
		// get the reference of all the graphical widget
		mSimplyStartButton = (Button) findViewById( R.id.simplybutton );
		mResultStartButton = (Button) findViewById( R.id.resultbutton );
	
		mResultView = (TextView) findViewById( R.id.resultFromActivityView );
		
		// set the listener for the two buttons
		// we use the same listener callback for both buttons, we will check inside
		// which one has been pressed
		mSimplyStartButton.setOnClickListener( this );
		mResultStartButton.setOnClickListener( this );
	
	}

	@Override
	public void onClick(View v)
	{	
		// if the button to launch the activity has been pressed
		if ( v.getId() == mSimplyStartButton.getId() )
		{
			Log.i( TAG, "Button Simply pressed" );
			// set the explicit intent and launch the activity
			Intent newInt = new Intent( this, PlanetChooserActivity.class );
			startActivity( newInt );
		}
		// if the button to launch the activity with result has been pressed
		else if ( v.getId() == mResultStartButton.getId() )
		{
			Log.i( TAG, "Button Result pressed" );
			// set the explicit intent and launch the activity
			Intent newInt = new Intent( this, PlanetChooserActivity.class );
			newInt.setAction( Intent.ACTION_PICK );
			startActivityForResult( newInt, GET_PLANET );
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

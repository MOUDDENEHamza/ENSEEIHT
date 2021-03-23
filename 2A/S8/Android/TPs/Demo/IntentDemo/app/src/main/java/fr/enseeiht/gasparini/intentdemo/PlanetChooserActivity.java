package fr.enseeiht.gasparini.intentdemo;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Spinner;
import android.widget.TextView;

public class PlanetChooserActivity extends Activity  implements OnItemSelectedListener
{
	
	private final static String TAG = "SecondActivity";

	private Spinner mSpinner;

	private TextView mResultText;
	String[] mPlanets;
	
	protected Adapter initializedAdapter = null;		
	
	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_second );
		
		// check whether the activity has been started with an intent
		// just for debugging purposes
		if( getIntent().getAction() == Intent.ACTION_PICK )
		{
			Log.i( TAG, "Activity called for result with ACTION_PICK" );
		}
		else
		{
			Log.i( TAG, "Activity called with "+getIntent().getAction() );
		}
		
		// get the reference of all the graphical widget
		mSpinner = (Spinner) findViewById( R.id.spinner1 );	
		mResultText = (TextView) findViewById( R.id.resultText );	
		mPlanets = getResources().getStringArray(R.array.planets_array);	
		// set the callback for the spinner
		mSpinner.setOnItemSelectedListener( this );

	}
	
	
	
	@Override
	public void onItemSelected(AdapterView<?> parent, View arg1, int pos,
			long arg3)
	{
		// workaround for avoind the very first call
		// from http://stackoverflow.com/questions/3637704/how-to-avoid-having-android-spinner-call-itemselectedlistener-when-setting-adapt
        
		// Always ignore the initial selection performed after setAdapter
        if( initializedAdapter !=parent.getAdapter() ) 
        {
        	initializedAdapter = parent.getAdapter();
        	Log.i( TAG, "first call to onItemSelected" );
            return;
        }
		
		// check if we are running because of an intent		
		if( getIntent().getAction() == Intent.ACTION_PICK )//|| getIntent().getAction() == Intent.ACTION_GET_CONTENT)
		{
			Log.i( TAG, "Activity called for result with ACTION_PICK" );
			
			// create the result intent
			Intent resultIntent = new Intent();              
			// add the result as an extra
			resultIntent.putExtra( "ChoosenPlanet", mPlanets[pos] );
			// set the result as positive
			setResult(Activity.RESULT_OK, resultIntent);
			
			finish();
		}
		else
		{
			Log.i( TAG, "Activity called with "+getIntent().getAction() );
		}
		
		mResultText.setText( mPlanets[pos] );
		
	}

	@Override
	public void onNothingSelected(AdapterView<?> arg0)
	{
		// TODO Auto-generated method stub
		
	}

	
	
}

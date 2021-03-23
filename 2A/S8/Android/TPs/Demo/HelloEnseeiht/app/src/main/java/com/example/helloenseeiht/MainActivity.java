package com.example.helloenseeiht;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

public class MainActivity extends Activity implements View.OnClickListener
{

	public void buttonClick(View v)
	{
		// deal with the button action here
		
	}
	
	private View.OnClickListener buttonLis = new View.OnClickListener()
	{
		
		@Override
		public void onClick( View v )
		{
			// TODO Auto-generated method stub
			
		}
	};
	
	@Override
	protected void onCreate( Bundle savedInstanceState )
	{
		super.onCreate( savedInstanceState );
		setContentView( R.layout.activity_main );
		Button b = (Button) findViewById( R.id.button1 );
		b.setOnClickListener( new View.OnClickListener()
		{
			
			@Override
			public void onClick( View v )
			{
				// TODO Auto-generated method stub
				
			}
		} );
	}

	@Override
	public void onClick( View v )
	{
		if( v.getId() == R.id.button1 )
		{
			// code for button1
		}
		else if( v.getId() == R.id.button2 )
		{
			// code for button2
		}
		else if( v.getId() == R.id.button3 )
		{
			// code for button3
		}
		
	}
}

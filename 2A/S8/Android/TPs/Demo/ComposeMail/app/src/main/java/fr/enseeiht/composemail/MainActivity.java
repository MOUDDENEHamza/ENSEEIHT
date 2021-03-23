package fr.enseeiht.composemail;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity
{
	private final static String TAG = "ComposeMail";

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// get the reference to the "Compose" button
		Button composeButton = (Button) findViewById(R.id.buttonCompose);
		// set a callback for the button
		composeButton.setOnClickListener(new View.OnClickListener()
		{
			public void onClick(View view)
			{
				sendEmail();
			}
		});
	}

	protected void sendEmail()
	{
		Log.i(TAG, "Send email");

		// get the reference to the edit text
		EditText address = (EditText) findViewById(R.id.address);

		// prepare the intent
		Intent emailIntent = new Intent(Intent.ACTION_SEND);
		emailIntent.setData(Uri.parse("mailto:"));
		emailIntent.setType("text/plain");
		String[] recipients = new String[]{address.getText().toString()};
		emailIntent.putExtra(Intent.EXTRA_EMAIL, recipients);
		Log.v(TAG, "Finished sending email to" + address.getText().toString());
		//		 emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Your subject");
		//		 emailIntent.putExtra(Intent.EXTRA_TEXT, "Email message goes here");

		try
		{
			// start the activity
			startActivity( emailIntent );
//			startActivity(Intent.createChooser(emailIntent, "Send mail..."));
//			finish();
			Log.v(TAG, "Finished sending email...");
		} catch (android.content.ActivityNotFoundException ex)
		{
			Toast.makeText(MainActivity.this,
					"There is no email client installed.", Toast.LENGTH_SHORT).show();
		}
	}
}

package foo.ndkdemo;

public class SqrtDemo
{

	public static final double EPSILON = 0.05d;

	public static native double sqrtC( double d, double eps );

	public static double sqrtJava( double d, double eps )
	{
		double x0 = 10.0, x1 = d, diff;
		do
		{
			x1 = x0 - (((x0 * x0) - d) / (x0 * 2));
			diff = x1 - x0;
			// Log.d("Java",
			// String.format("x0=%12.8f, x1=%12.8f, diff=%12.8f\n",
			// x0, x1, diff));
			x0 = x1;
		}
		while( Math.abs( diff ) > EPSILON );
		return x1;
	}
	
	public static double sqrtJava( double d )
	{
		return sqrtJava( d, SqrtDemo.EPSILON );
	}
}

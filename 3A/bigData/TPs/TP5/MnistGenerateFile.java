import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;

public class MnistGenerateFile {

	static final String LABEL_FILE = "data/train-labels-idx1-ubyte";
	static final String IMAGE_FILE = "data/train-images-idx3-ubyte";
	static final String LIBSVM_FILE = "data/libsvm-mnist.txt";

	
	static int[] labels;
	static List<int[][]> images;
	static int rsize;
	static int csize;
	
	public static void loadFiles() {
		 labels = MnistReader.getLabels(LABEL_FILE);
		 images = MnistReader.getImages(IMAGE_FILE);
		 rsize = images.get(0).length;
		 csize = images.get(0)[0].length;
	}
	public static int getLabel(int n) {
		return labels[n];
	}
	public static int[][] getImage(int n) {
		return images.get(n);
	}
	
	
	public static void main(String[] args) {

		loadFiles();

		PrintWriter writer;
		try {
			File f = new File(LIBSVM_FILE);
			if (f.exists()) f.delete();
			
			writer = new PrintWriter(LIBSVM_FILE);

//			System.out.printf("================= LABEL %d\n", labels[0]);
//			System.out.printf("%s", MnistReader.renderImage(images.get(0)));

			for (int i=0;i<images.size()/10;i++) {
				boolean oneFeature = false;
				String s = ""+labels[i];
				for (int r=0;r<rsize;r++)
					for (int c=0;c<csize;c++) {
						int indice = r*csize+c+1;
						double value = (double)images.get(i)[r][c];
						//value /= 255;
						if (value != 0) {
							oneFeature = true;
							s += String.format(Locale.US, " %d:%f ", indice, value);
						}
					}
				if (oneFeature) writer.println(s);
			}
			
			writer.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}



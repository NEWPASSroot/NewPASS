package model;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class Unzip {
	
	private static final int BUFFER_SIZE = 4096;
	
	public void unzip(String zipFilePath, String dir) throws IOException {
		File directory = new File(dir);
		if (!directory.exists()) {
			directory.mkdir();
		}
		ZipInputStream zipInput = new ZipInputStream(new FileInputStream(zipFilePath));
		ZipEntry zipEntry = zipInput.getNextEntry();
		while (zipEntry != null) {
			String filePath = directory + File.separator + zipEntry.getName();
			if (!zipEntry.isDirectory()) {
				extractFile(zipInput, filePath);
			} else {
				new File(filePath).mkdir();
			}
			zipInput.closeEntry();
			zipEntry = zipInput.getNextEntry();
		}
		zipInput.close();
	}

	public void extractFile(ZipInputStream zipInput, String filePath) throws FileNotFoundException {
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
		byte[] bytesInput = new byte[BUFFER_SIZE];
		int read = 0;
		try {
			while ((read = zipInput.read(bytesInput)) != -1) {
				bos.write(bytesInput, 0, read);
			}
		} catch (IOException e) {
			System.out.println("ExtractFile error: " + e);
		}
		try {
			bos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("BufferedOutputStream error: " + e);
		}
	}
}

package Test;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.Arrays;
public class TestPlease 
{
	public static void main(String[] args) throws IOException 
	{		 
        String zipFileName = "C:\\Users\\7023\\Desktop\\directory\\zipText.zip";
        String unzipdirectory = "C:\\Users\\7023\\Desktop\\directory"; 
        unzip(zipFileName, unzipdirectory);
        Path zipfile = Paths.get(unzipdirectory);
        /**************파일경로를 배열로 뿌려주는 코드
        for(Path file_index : zipfile) 
        {
        	System.out.println(file_index);
        }
        *******/
        
        /***************해당 디렉토리 안의 파일 목록 내역을 뿌려주는 코드**********************/
        File dir = new File(unzipdirectory); 
        String[] filenames = dir.list(); 
        for (String filename : filenames) 
        { System.out.println("filename : " + filename); }
       
        
        /*********************텍스트 파일을 읽어오는 코드****************************/
        String upzipFileName = filenames[0];
        BufferedReader reader = new BufferedReader(new FileReader( unzipdirectory + "\\" + upzipFileName));
		String data;
		String[] data_ary;
		TestResultValueVO tvo = new TestResultValueVO();
		while ((data = reader.readLine()) != null) 
		{
			data_ary = data.split(":");
			//tvo.getDataInfo(data);
			String s = data_ary[1];
			System.out.println(s);
			tvo.setResultValue(tvo, s);
			tvo.PrintResultValue(tvo);
			int firstMaxindex = tvo.getMaxIndexValue1(tvo);
			int secondMaxindex = tvo.getMaxIndexValue2(tvo, firstMaxindex);
			tvo.getFirstValue(firstMaxindex);
			tvo.getAllValue(secondMaxindex);
			
		}
		
		
		
		/****************[주의]reader를 닫고 나면 텍스트를 읽어올 수 없다******************/
		reader.close();
    }
	
	
	
	
	
	
	
	
	
	
	
	
	

	 public static void unzip(String zipFileName, String unzipdir) 
	 { 
		 try(ZipInputStream zis = new ZipInputStream(new BufferedInputStream(new FileInputStream(zipFileName)))) 
		 {
			 // Read each entry from the ZIP file  
			 ZipEntry entry; 
			 while ((entry = zis.getNextEntry()) != null) 
			 { 
				 // Extract the entry's contents 
				 extractEntryContent(zis, entry, unzipdir);
			 } 

	            System.out.println("ZIP file's contents have been extracted to " + (new File(unzipdir)).getAbsolutePath()); 
	      }catch (IOException e) { e.printStackTrace(); } 
	  } 

	    public static void extractEntryContent(ZipInputStream zis, ZipEntry entry, String unzipdir) throws IOException, FileNotFoundException 
	    { 

	        String entryFileName = entry.getName(); 
	        String entryPath = unzipdir + File.separator + entryFileName; 

	        // Create the entry file by creating necessary directories 
	        createFile(entryPath); 

	        // Create an output stream to extract the contents of the  
	        // zip entry and write to the new file 
	        try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(entryPath))) { 
	            byte[] buffer = new byte[1024]; 
	            int count; 
	            while ((count = zis.read(buffer)) != -1) 
	            { 
	                bos.write(buffer, 0, count); 
	            } 
	        } 
	    } 

	    public static void createFile(String filePath) throws IOException 
	    { 
	        File file = new File(filePath); 
	        File parent = file.getParentFile(); 

	        // Create all parent directories if they do not exist 
	        if (!parent.exists()) 
	        { 
	            parent.mkdirs(); 
	        } 
	        file.createNewFile(); 
	    } 	
	    
	    
}

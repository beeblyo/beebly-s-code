package Test;

import java.io.File;
import org.zeroturnaround.zip.ZipUtil;
import ego.vo.TestVO;

public class ZipTest {

	public static void main(String[] args) {
		
		TestVO vo = new TestVO();
		vo.setTestNumber("1");
		vo.setTestTitle("zip Å×½ºÆ®");
		vo.setFoldername("test01");
		vo.setCategoryNumber("1");
		
		ZipUtil.unpack(new File("C:\\Users\\MYCOM\\Desktop\\"+vo.getFoldername()+".zip"), new File("C:\\Temp\\testlist\\"+vo.getFoldername()));
	}

}

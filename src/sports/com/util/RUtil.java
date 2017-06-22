package sports.com.util;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.Rengine;

public class RUtil {
 public RUtil(){
	 Rengine re = new Rengine(new String[] {"--vanilla"}, false, null);
	 System.out.println("R 연동 ");

	 if (!re.waitForR()){
	 	System.out.println("R 연동 안되고 있어 .");
	 	return;
	 }
	 	
	 re.eval("a <- 3 " ,true);
	 re.eval("b <- 4.5 " ,true);
	 re.eval("c <- a+b " ,true);
	 REXP x = re.eval("c",true);
	 System.out.println(x.asDouble());
	 
 }
 }

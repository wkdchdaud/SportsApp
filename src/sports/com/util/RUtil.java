package sports.com.util;

import java.util.List;
import java.util.Vector;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.RList;
import org.rosuda.JRI.Rengine;

import sports.com.dto.Ord_testDTO;
import sports.com.dto.R_testDTO;

public class RUtil {
 public double R_list(List<Ord_testDTO> list){
	 Rengine re = new Rengine(new String[] {"--vanilla"}, false, null);
	 
	 System.out.println("R 연동 ");

	 if (!re.waitForR()){
	 	System.out.println("R 연동 안되고 있어 .");
	 }
	 
	 for(Ord_testDTO qwe : list){
		 
		 System.out.println(qwe.getOp_no());
		 System.out.println(qwe);
		 re.eval("df <- c(" + qwe.getOp_no() + ", df ) " );
		System.out.println(list.size());
	 
	 }
	 
	 REXP y =re.eval("df");
	 System.out.println(y.asVector());
	 
	 /*System.out.println("list: " + list);*/
	/* re.eval("install.packages('arulesViz')");*/
//	 System.out.println("library : " + re.eval("library(arulesViz)"));
	 
	 re.eval("library(arules)");
	 re.eval("data(Epub)");
	 re.eval("Epub_rule_2 <- apriori(data = Epub, parameter = list(support = 0.001, confidence = 0.20, minlen = 2))");
	 re.eval("df <- inspect(Epub_rule_2[1:20])");
	 re.eval("df$lift");
	 re.eval("df2 <- df$lift");
	 
	 Object obj = re.eval("df$lift");
	 
	 System.out.println("return type=" + obj.getClass().getName());
	 System.out.println("obj.toString() : " + obj.toString());
	 
//	 for (int i = 0 ; i  < obj.toString().length(); i++){
//		 System.out.println("for obj.toString() : " + obj.toString());
//	 }
	 
	 System.out.println("ver : " + obj.toString());
	 
	 REXP x =re.eval("df2");
	 
	 System.out.println("x.toString() : " + x.asDoubleArray());
	 
	 double[] qwe = x.asDoubleArray();
	 int i = 0;
	 for (double a : qwe){
		 i++;
		 System.out.println(i+ "번째는 :" + a + "   값 입니다  ");
	 }
	 
	
	/*REXP x =re.eval("df[1]");*/
	System.out.println();
	
	 return 1.1;
 }
 }
